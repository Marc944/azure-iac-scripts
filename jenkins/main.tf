resource "azurerm_virtual_machine" "jenkins" {
  name                  = "jenkins-vm"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.jenkins.id]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "jenkins_os_disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "jenkinsvm"
    admin_username = "azureuser"
    admin_password = "P@ssw0rd1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "testing"
  }
}

resource "azurerm_network_interface" "jenkins" {
  name                = "jenkins-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.jenkins.id
  }
}

resource "azurerm_public_ip" "jenkins" {
  name                = "jenkins-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "null_resource" "install_jenkins" {
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "azureuser"
      password = "P@ssw0rd1234!"
      host     = azurerm_public_ip.jenkins.ip_address
    }

    script = "${path.module}/install_jenkins.sh"
  }
}

