package com.sale.webshopping.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.sale.webshoppingbackend.dto.Product;

public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		return Product.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		Product product = (Product) target;

		// check whether file has been selected or not
		if (product.getFile() == null || product.getFile().getOriginalFilename().equals("")) {

			errors.rejectValue("file", null, "Please select an image to upload!");
			
			return;
		}
		
		if(!(product.getFile().getContentType().equals("image/jpeg") || 
				product.getFile().getContentType().equals("image/png") || 
				product.getFile().getContentType().equals("image/gif")))
		{
			errors.rejectValue("file", null, "Please use only image file for upload!");
			return;
		}

	}

}
