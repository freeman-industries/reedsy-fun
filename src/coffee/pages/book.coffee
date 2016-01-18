app.controller 'bookController', ['$scope', '$route', '$routeParams', ($scope, $route, $routeParams) ->
	# thx stack overflow
	$scope.shuffle = (array) ->
	    counter = array.length
	    temp = null
	    index = null

	    while counter > 0
	        index = Math.floor(Math.random() * counter);

	        counter--;

	        temp = array[counter]
	        array[counter] = array[index]
	        array[index] = temp

	    return array

	$scope.book == null

	# find the product data for our book...
	for book in $rootScope.books
		if book.slug == $routeParams.slug
			$scope.book = book

	related = []

	# get related books for genre and category
	for book in $rootScope.books
		if book.genre.name == $scope.book.genre.name or book.genre.category == $scope.book.genre.category
			related.push(book)

	$scope.related = $scope.shuffle(related)

	return null
]
