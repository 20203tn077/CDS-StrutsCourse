app.controller('role', ($scope, $http) => {
    $scope.statuses = []
    $scope.roles = []
    $scope.roleActive = {}

    $scope.showRegister = () => {
        $scope.roleActive = {}
        $('#modalRegister').modal('show')
    }
    $scope.showUpdate = (id) => {
        $scope.roleActive = angular.copy($scope.roles.find((role) => role.id === id))
        $('#modalUpdate').modal('show')
    }
    $scope.showDelete = (id) => {
        $scope.roleActive = angular.copy($scope.roles.find((role) => role.id === id))
        $('#modalDelete').modal('show')
    }
    $scope.showDetails = (id) => {
        $scope.roleActive = $scope.roles.find((role) => role.id === id)
        $('#modalDetails').modal('show')
    }

    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded"
    $scope.getStatuses = () => {
        $http({
            method: 'POST',
            url: 'ejemplo1_war_exploded/findAllStatuses'
        }).then(({data: {statuses}}) => {
            $scope.statuses = statuses
        })
    }
    $scope.getRoles = () => {
        $http({
            method: 'POST',
            url: 'ejemplo1_war_exploded/findAllRoles'
        }).then(({data: {roles}}) => {
            $scope.roles = roles
        })
    }
    $scope.createRole = () => {
        $http({
            method: 'POST',
            url: 'ejemplo1_war_exploded/createRole',
            data: `data=${JSON.stringify($scope.roleActive)}`
        }).then(() => {
            $scope.getRoles()
            $('#modalRegister').modal('hide')
        })
    }
    $scope.updateRole = () => {
        $http({
            method: 'POST',
            url: 'ejemplo1_war_exploded/updateRole',
            data: `data=${JSON.stringify($scope.roleActive)}`
        }).then(({data: {statuses}}) => {
            $scope.getRoles()
            $('#modalUpdate').modal('hide')
        })
    }

    $scope.deleteRole = () => {
        $scope.roleDelete.status = $scope.statuses[1]
        $http({
            method: 'POST',
            url: 'ejemplo1_war_exploded/updateRole',
            data: `data=${JSON.stringify($scope.roleDelete)}`
        }).then(({data: {statuses}}) => {
            $scope.getRoles()
            $('#modalDelete').modal('hide')
        })
    }


    $scope.getStatuses()
    $scope.getRoles()
})