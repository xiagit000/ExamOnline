$(document).ready(function() {
	
	$("#reservation").daterangepicker({
		ranges: {
            'Today': ['today', 'today'],
            'Yesterday': ['yesterday', 'yesterday'],
            'Last 7 Days': [Date.today().add({ days: -6 }), 'today'],
            'Last 30 Days': [Date.today().add({ days: -29 }), 'today'],
            'This Month': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
            'Last Month': [Date.today().moveToFirstDayOfMonth().add({ months: -1 }), Date.today().moveToFirstDayOfMonth().add({ days: -1 })]
         },
		format: 'yyyy/MM/dd'
	},
    function(start, end) {
       $('#createDate').val(start.toString('yyyy/MM/dd') + " - " + end.add({ days: +1 }).toString('yyyy/MM/dd'));
    }
	);
});
 


