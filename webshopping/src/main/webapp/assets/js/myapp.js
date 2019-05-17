$(function() {
	// solving active menu highlighting
	switch (menu) {

	case 'About Us':
		$('#about').addClass('active');
		break;

	case 'Contact Us':
		$('#contact').addClass('active');
		break;

	case 'All Products':
		$('#listProducts').addClass('active');
		break;
	default:
		if (menu == "Home")
			break;
		$('#listProducts').addClass('active');
		$('#a_' + menu).addClass('active');
		break;
	}

	// code for jQuery dataTable

	var $table = $('#productListTable');

	// execute the below code only where we have this table
	if ($table.length) {
		// console.log('Inside the table!');
		var jsonUrl = '';
		if (window.categoryId == '') {
			jsonUrl = window.contextRoot + '/json/data/all/products';

		} else {
			jsonUrl = window.contextRoot + '/json/data/category/' + window.categoryId + '/products';
		}

		$table.DataTable({

			lengthMenu : [ [ 3, 5, 10 ],
					[ '3 records', '5 records', '10 records', 'ALL' ] ],
			pageLength : 5,
			ajax : {
				url : jsonUrl,
				dataSrc : ''
			},
			columns : [
					{
						data : 'code',
						mRender: function(data,type,row){
							return '<img src="'+window.contextRoot+'/resources/images/'+data+'.jpg" class = "dataTableImg"/>'
						}
					},
					{
						data : 'name',
					},
					{
						data : 'brand',
					},
					{
						data : 'unitPrice',
						mRender : function(data, type, row) {
							return '&euro; ' + data
						}
					},
					{
						data : 'quantity',
					},
					{
						data: 'id',
						bSortable: false,
						mRender: function(data, type, row) {
							var str = '';
							str += '<a href="' + window.contextRoot + '/show/' + data + '/product" class="btn btn-primary"><span class="fa fa-eye"></span></a> &#160;';
							str += '<a href="' + window.contextRoot + '/cart/add/' + data + '/product" class="btn btn-success"><span class = "fa fa-shopping-cart"></span></a>';
							return str;
						}
					}

			]
		});
	}

});