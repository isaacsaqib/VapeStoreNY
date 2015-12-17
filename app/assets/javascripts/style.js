$(document).ready(function(){
	$("#all-table").hide();

	// Hiding Tables and Forms

	function HideTableAndForm(name) {
		$("#" + name + "-table").hide();
		$("#" + name + "-form").hide();
	};


	// Showing Tables 

	function ShowListingTable(li_id, name) {
		$("#listings-nav li:nth-child(" + li_id + ")").on("click", function(){
			$("#" + name + "-table").fadeIn();

		});

	};

	// Showing Add Listing Forms

	function ShowNewListingForm(name, name2) {
		$("#" + name + "-add").on("click", function(){
			$("#" + name + "-form").fadeIn();
		});
	};

	// Calling Functions Above For Each Listing

	HideTableAndForm('ejuice');
	HideTableAndForm('device');



	ShowNewListingForm('ejuice');
	ShowListingTable('2', 'ejuice');

	ShowNewListingForm('device');
	ShowListingTable('3', 'device');


});


