app.controller('user', ($scope, $http, $window) => {
    $scope.saludo = "Hola, Rebecca"
    $scope.statuses = []
    $scope.roles = []
    $scope.users = []
    $scope.userActive = {}
    $scope.rolesSelectable = []
    $scope.rolesSelected = []

    $scope.showRegister = () => {
        $scope.userActive = {}
        $('#modalRegister').modal('show')
    }
    $scope.showUpdate = (id) => {
        $scope.userActive = angular.copy($scope.users.find((user) => user.id === id))
        $('#modalUpdate').modal('show')
    }
    $scope.showDelete = (id) => {
        $scope.userActive = angular.copy($scope.users.find((user) => user.id === id))
        $('#modalDelete').modal('show')
    }
    $scope.showDetails = (id) => {
        $scope.userActive = $scope.user.find((user) => user.id === id)
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
    // $scope.getUsers = () => {
    //     $http({
    //         method: 'POST',
    //         url: 'ejemplo1_war_exploded/findAllUsers'
    //     }).then(({data: {users}}) => {
    //         $scope.roles = users
    //     })
    // }
    $scope.createUser = () => {
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
    // $scope.getUsers()
})