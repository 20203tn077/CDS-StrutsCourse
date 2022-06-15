app.controller('user', ($scope, $http, $window) => {
    $scope.saludo = "Hola, Rebecca"
    $scope.statuses = []
    $scope.roles = []
    $scope.users = []
    $scope.userActive = {
        roles: []
    }
    $scope.rolesSelectable = []

    $scope.showRegister = () => {
        $scope.userActive = {
            roles: []
        }
        $scope.rolesSelectable = angular.copy($scope.roles)
        $('#modalRegister').modal('show')
    }
    $scope.showUpdate = (id) => {
        $scope.userActive = angular.copy($scope.users.find((user) => user.id === id))
        $scope.rolesSelectable = angular.copy($scope.roles).filter(role => ((role) => {
            for(let i of $scope.userActive.roles) {
                if (i.id == role.id) return false;
            }
            return true
        }) (role))
        $('#modalUpdate').modal('show')
    }
    $scope.showDelete = (id) => {
        $scope.userActive = angular.copy($scope.users.find((user) => user.id === id))
        $('#modalDelete').modal('show')
    }
    $scope.showDetails = (id) => {
        $scope.userActive = $scope.users.find((user) => user.id === id)
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
    $scope.getUsers = () => {
        $http({
            method: 'POST',
            url: 'ejemplo1_war_exploded/findAllUsers'
        }).then(({data: {users, message}}) => {
            console.log(users)
            console.log(message)
            users.forEach(user => user.person.birthdate = new Date(user.person.birthdate))
            console.log(users)
            $scope.users = users
        })
    }
    $scope.createUser = () => {
        console.log($scope.userActive)
        $http({
            method: 'POST',
            url: 'ejemplo1_war_exploded/createUser',
            data: `data=${JSON.stringify($scope.userActive)}`
        }).then(({data: {message}}) => {
            console.log(message)
            $scope.getUsers()
            $('#modalRegister').modal('hide')
        })
    }
    $scope.updateUser = () => {
        console.log($scope.userActive)
        $http({
            method: 'POST',
            url: 'ejemplo1_war_exploded/updateUser',
            data: `data=${JSON.stringify($scope.userActive)}`
        }).then(({data: {message}}) => {
            console.log(message)
            $scope.getUsers()
            $('#modalUpdate').modal('hide')
        })
    }

    $scope.deleteRole = () => {
        $scope.roleDelete.status = $scope.statuses[1]
        $http({
            method: 'POST',
            url: 'ejemplo1_war_exploded/updateUser',
            data: `data=${JSON.stringify($scope.userActive)}`
        }).then(({data: {message}}) => {
            console.log(message)
            $scope.getUsers()
            $('#modalDelete').modal('hide')
        })
    }

    $scope.selectRole = (id) => {
        $scope.rolesSelectable = $scope.rolesSelectable.filter(role => role.id !== id)
        $scope.userActive.roles.push($scope.roles.find(role => role.id === id))
    }
    $scope.removeRole = (id) => {
        $scope.userActive.roles = $scope.userActive.roles.filter(role => role.id !== id)
        $scope.rolesSelectable.push($scope.roles.find(role => role.id === id))
    }

    $scope.getStatuses()
    $scope.getRoles()
    $scope.getUsers()
})