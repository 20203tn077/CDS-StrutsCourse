<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="modalDelete" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Eliminar usuario</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>¿Deseas eliminar al usuario <span class="font-weight-bold" ng-bind="`${userActive.person.name} ${userActive.person.surname} ${userActive.person.lastname}`"></span>?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="button" ng-click="deleteUser()" class="btn btn-danger">Eliminar</button>
            </div>
        </div>
    </div>
</div>