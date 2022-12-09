resource "azurerm_network_interface" "test" {
  name                = "mynic"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.public_ip_address_id}"
  }

  tags = {
      demo =  "project3dem"
  }
}

resource "azurerm_linux_virtual_machine" "test" {
  name                = "myvm"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  size                = "Standard_B1s"
  admin_username      = "${var.admin_username}"
  network_interface_ids = [azurerm_network_interface.test.id]
  admin_ssh_key {
    username   = "${var.admin_username}"
    #public_key = file("~/.ssh/id_rsa.pub")
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDlevnmEsqYpLR2Ndr0IiQjHBFvwjBx1EdZ+qGVWa6x4ryjJlJp4o4s4d6Sa9Jlk42rcoH0mh8edRiRRDU17ShSZWQRBuNUgSY7avKQE/5Si+uIpr7Ln5tVsGrRPUmlSlWyjxi9+IPaBXk7AhUgdH0XJViXssGfavBIM9N1C92a1QuR9BTrQOuIghTo1tCYK3HXACeBD6O99/7p/0iT9zaSei53hrmzkbYT0kHJvJJYQUtSgqyePBYE/DkWvJgkU/sAPAFV4Oc0zeIUmuWIbBMOZQAtjKgD4LNGNSifb+k+KdchaVs9pBtILECV8w052nho7AAEjFCMLjfMKCGEkQs+zxVwPEyhKqb3+wVbN2qzUlyktDvBQIxnRinT1NfuQb3Lbhr546Ubo8rjdFCFMHqK0+yFTJsz+Alv0MtuN4dbuhogHruD0tA4HuDFUSSQCgCHvQ+Z4GYR8GzcbBqQ1t7cykimL7zp7WBoKo3QigxRcpdNHbgCgoFTO+RphGas/ic= Sanjida.Orin@TC05"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  tags = {
      demo =  "project3dem"
  }
}
