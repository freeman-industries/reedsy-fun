app.controller 'homeController', ['$scope', '$route', '$rootScope', ($scope, $route, $rootScope) ->

	# selectedCategory = $rootScope.selectedCategory
	# selectedGenre = $rootScope.selectedGenre

	$scope.filter = () ->
		$rootScope.books = JSON.parse(JSON.stringify($rootScope.books))

	return null

]