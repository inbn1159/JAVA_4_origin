$(document).ready(function() {
 	let searchForm = $('#searchForm');

	$('#searchForm button').on('click', function(e) {
		let keyword = searchForm.find('input[name="keyword"]');
		if(!keyword.val()) {
			alert('키워드를 입력하세요');
			keyword.focus();
			return false;
		}
		e.preventDefault();

		searchForm.submit();
	});
});