﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/UZero.Master" AutoEventWireup="true" CodeBehind="AdminUpdate.aspx.cs" Inherits="UZeroConsole.Web.UZero.Sso.AdminUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <form runat="server">
        <!-- Page Header -->
        <div class="content bg-gray-lighter">
            <div class="row items-push">
                <div class="col-sm-7">
                    <h1 class="page-heading">添加管理员<small></small>
                    </h1>
                </div>
                  <div class="col-sm-5 text-right hidden-xs">
                            <ol class="breadcrumb push-10-t">
                                <li><a class="link-effect" href="AdminList.aspx">管理员列表</a></li>
                                <li>编辑管理员信息</li>
                            </ol>
                        </div>
            </div>
        </div>
        <!-- END Page Header -->
        <!-- Page Content -->
        <div class="content">
            <!-- Dynamic Table Full -->
            <div class="block">
                <div class="block-content block-content-narrow">
                    <asp:Literal runat="server" ID="ltlMessage"></asp:Literal>
                    <div class="form-horizontal push-10-t">
                        <div class="form-group">
                            <div class="col-xs-12">
                                <div class="form-material">
                                    <asp:TextBox runat="server" ID="tbUsername" CssClass="form-control" Enabled="false"></asp:TextBox>
                                    <label >用户名</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <div class="form-material">
                                    <asp:TextBox runat="server" ID="tbName" CssClass="form-control"></asp:TextBox>
                                    <label >姓名（昵称）</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" id="roles">
                            <div class="col-xs-12">
                                <div class="form-material">
                                    <asp:PlaceHolder runat="server" ID="phRoles"></asp:PlaceHolder>
                                    <asp:HiddenField runat="server" ID="hfRoleId" />
                                    <label>角色</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <div class="form-material">
                                    <asp:TextBox runat="server" ID="tbUNoteUsername" CssClass="form-control" ></asp:TextBox>
                                    <label >UNote用户名</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <div class="form-material">
                                    <asp:TextBox runat="server" ID="tbRemark" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                    <label >备注</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <asp:Button runat="server" ID="btnSave" CssClass="btn btn-primary"  Text="保存"   /> <a href="/UZero/AdminBindCorpWeixin.aspx?adminId= <%=Model.Admin.Id %>" target="_blank" class="btn btn-default">绑定企业微信</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END Dynamic Table Full -->
        </div>
        <!-- END Page Content -->
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script>
        $(function () {
            //console.log($('#<%= hfRoleId.ClientID%>').val());
            $('#roles input[type=checkbox]').click(function () {
                var $hfRoleIds = $('#<%= hfRoleId.ClientID%>');

                var value = $(this).val();
                var idList = $hfRoleIds.val().split(',');
                var ids = [];
                var saveIds = "";

                for (var i = 0; i < idList.length; i++) {
                    if (idList[i] != '') {
                        ids.push(idList[i]);
                    }
                }

                if (ids.length > 0) {
                    var exists = false;
                    for (var j = 0; j < ids.length; j++) {
                        if (parseInt(ids[j]) == parseInt(value)) {
                            exists = true;
                        }
                    }

                    if (!exists) {
                        ids.push(parseInt(value));
                    } else {
                        var tempIds = [];
                        for (var k = 0; k < ids.length; k++) {
                            if (parseInt(ids[k]) != parseInt(value)) {
                                tempIds.push(parseInt(ids[k]));
                            }
                        }
                        ids = tempIds;
                    }

                    for (var l = 0; l < ids.length; l++) {
                        saveIds += ids[l];
                        if (l != (ids.length - 1)) {
                            saveIds += ',';
                        }
                    }
                } else {
                    saveIds = value;
                }
                $hfRoleIds.val(saveIds);
            });
        });
    </script>
</asp:Content>
