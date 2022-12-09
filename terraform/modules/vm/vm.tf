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
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDE3hw+uyv1Z7lpPXD4+taj5t60WzEGQGX8Gb+ranFblwGNYYfqO5e2Ygv6wapT6SGih806LHrzU8FnlkfYGE/DCSruQ+I8LwMTEGzakZ1FdRvxMvXHiupvGdDeIC9fp1MQXwN5t2Nkd915or40Z7UNDGlpzErnabwBEtzuY7123mJWpdrj2I07FuVtbvLu7gls3nN3j2Ab2lKTfEphDs34STYkTOZ6hC+0+Iv9HFiL6lO4Yn0Ck3cU3h/r7AiXUHygS9eGScaxtHpBIwiuoV/9fBOpNIv5xdbOqovnlXLCuVnEeLuehJniW9D/birnqJYo3n7CmI4t7uSnBTQJPr9O01ZPPDfc4YyHRz+TmhznbkIG4RFA8k++kVrV00D7ZUeg3PY5BLY6GU14a1McFcV1u6Tekw+1fJoZ/zq7SdEEPru0aPm0FkNoI77E8cSb91wOUwXRzcJcHbEy0FTYEyEFEcp+E3xxI49V08PSng7pAF1ZPHm7c60RD4iHqYXmRf8= gohin@cc-2074-bef295b0-5ff7767b9c-zxj5s"
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
