app.controller('role', ($scope, $http, $window) => {
    $scope.saludo = "Hola, Rebecca"
    $scope.showRegister = () => {
        $('#modalRegister').modal('show')
    }
    $scope.showUpdate = (id) => {
        $scope.roleUpdate = angular.copy($scope.roles.find((role) => role.id === id))
        $('#modalUpdate').modal('show')
    }
    $scope.showDelete = (id) => {
        $scope.roleDelete = angular.copy($scope.roles.find((role) => role.id === id))
        $('#modalDelete').modal('show')
    }
    $scope.showDetails = (id) => {
        $scope.roleDetails = $scope.roles.find((role) => role.id === id)
        $('#modalDetails').modal('show')
    }

    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded"
    $scope.statuses = []
    $scope.roles = []
    $scope.role = {}
    $scope.getStatuses = () => {
        $http({
            method: 'POST',
            url: 'ejemplo1_war_exploded/findAllStatuses'
        }).then(({data: {statuses}}) => {
            console.log(statuses)
            $scope.statuses = statuses
        })
    }
    $scope.getRoles = () => {
        $http({
            method: 'POST',
            url: 'ejemplo1_war_exploded/findAllRoles'
        }).then(({data: {roles}}) => {
            console.log(roles)
            $scope.roles = roles
        })
    }
    $scope.createRole = () => {
        console.log($scope.role)
        $http({
            method: 'POST',
            url: 'ejemplo1_war_exploded/createRole',
            data: `data=${JSON.stringify($scope.role)}`
        }).then(() => {
            $scope.getRoles()
            $('#modalRegister').modal('hide')
        })
    }
    $scope.updateRole = () => {
        console.log($scope.roleUpdate)
        $http({
            method: 'POST',
            url: 'ejemplo1_war_exploded/updateRole',
            data: `data=${JSON.stringify($scope.roleUpdate)}`
        }).then(({data: {statuses}}) => {
            $scope.getRoles()
            $('#modalUpdate').modal('hide')
        })
    }

    $scope.deleteRole = () => {
        $scope.roleDelete.status = $scope.statuses[1]
        console.log($scope.roleDelete)
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