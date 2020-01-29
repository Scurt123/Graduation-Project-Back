<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="confirmModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">众筹网</h4>
            </div>
            <div class="modal-body">
                <p>您确定要删除下面的显示的内容吗？</p>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th width="30">#</th>
                        <th>名称</th>
                    </tr>
                    </thead>
                    <tbody id="confirmModalTableBody"></tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button id="confirmModalBtn" type="button" class="btn btn-primary">确定</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
