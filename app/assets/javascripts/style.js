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
			$(".products").hide();
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
	HideTableAndForm('tank');
	HideTableAndForm('rda');
	HideTableAndForm('drip_kit');
	HideTableAndForm('wire');
	HideTableAndForm('wick');
	HideTableAndForm('replacement_part');
	HideTableAndForm('replacement_coil');
	HideTableAndForm('essential-rda');
	HideTableAndForm('batteries');
	HideTableAndForm('charger');
	HideTableAndForm('cases_and_mod_pouch');



	ShowNewListingForm('ejuice');
	ShowListingTable('1', 'ejuice');

	ShowNewListingForm('device');
	ShowListingTable('2', 'device');

	ShowNewListingForm('tank');
	ShowListingTable('3', 'tank');

	ShowNewListingForm('rda');
	ShowListingTable('4', 'rda');

	ShowNewListingForm('drip_kit');
	ShowListingTable('5', 'drip_kit');

	ShowNewListingForm('wire');
	ShowListingTable('6', 'wire');

	ShowNewListingForm('wick');
	ShowListingTable('7', 'wick');

	ShowNewListingForm('replacement_part');
	ShowListingTable('8', 'replacement_part');

	ShowNewListingForm('replacement_coil');
	ShowListingTable('9', 'replacement_coil');

	ShowNewListingForm('essential-rda');
	ShowListingTable('10', 'essential-rda');

	ShowNewListingForm('charger');
	ShowListingTable('11', 'charger');

	ShowNewListingForm('batteries');
	ShowListingTable('12', 'batteries');

	ShowNewListingForm('cases_and_mod_pouch');
	ShowListingTable('13', 'cases_and_mod_pouch');



});


