<%@ Page Title="Manage Admins" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageAdmins.aspx.cs" Inherits="CabuyaoCityWebsite.Pages.Admin.ManageAdmins" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Manage Admins</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/Admin/ManageAdmins.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="upAdmins" runat="server">
        <ContentTemplate>
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center mb-4 gap-3">
                <h3 class="fw-bold text-cabuyao-green m-0">Admin Accounts</h3>
                <asp:LinkButton ID="btnAddAdmin" runat="server" CssClass="btn btn-green btn-success fw-bold shadow-sm" OnClick="btnAddAdmin_Click">
                    <i class="bi bi-person-plus-fill me-2"></i> Add New Admin
                </asp:LinkButton>
            </div>

            <asp:Panel ID="pnlGlobalAlert" runat="server" Visible="false" role="alert" CssClass="mt-3" EnableViewState="false">
                <asp:Label ID="lblGlobalAlert" runat="server"></asp:Label>
            </asp:Panel>

            <div class="admin-card bg-white p-0 shadow-sm overflow-hidden">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="table-light small text-uppercase">
                            <tr>
                                <th class="ps-4">User</th>
                                <th>Username</th>
                                <th class="text-end pe-4">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptAdmins" runat="server" OnItemCommand="rptAdmins_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td class="ps-4" style="width: 80px;">
                                            <div class="admin-avatar shadow-sm">
                                                <i class="bi bi-person-badge"></i>
                                            </div>
                                        </td>
                                        <td class="fw-bold text-dark fs-6">
                                            <%# Eval("Username") %>
                                            <%-- Tag the currently logged in user --%>
                                            <asp:Label ID="lblCurrentUser" runat="server" CssClass="badge bg-success ms-2" 
                                                       Visible='<%# Eval("Username").ToString() == Session["AdminUser"]?.ToString() %>'>You</asp:Label>
                                        </td>
                                        <td class="text-end pe-4">
                                            <div class="d-flex justify-content-end gap-2">
                                                <%-- Edit Button --%>
                                                <asp:LinkButton ID="btnEdit" runat="server" 
                                                    CommandName="EditAdmin" 
                                                    CommandArgument='<%# Eval("AdminID") %>' 
                                                    CssClass="btn btn-sm-custom btn-outline-cabuyao fw-bold px-3">
                                                    <i class="bi bi-pencil-square"></i> 
                                                    <span class="d-none d-md-inline ms-1">Edit</span>
                                                </asp:LinkButton>
        
                                                <%-- Delete Button --%>
                                                <asp:LinkButton ID="btnDelete" runat="server" 
                                                    CommandName="PromptDelete" 
                                                    CommandArgument='<%# Eval("AdminID") %>' 
                                                    CssClass="btn btn-sm-custom btn-outline-danger-custom fw-bold px-3"
                                                    Visible='<%# Eval("Username").ToString() != Session["AdminUser"]?.ToString() %>'>
                                                    <i class="bi bi-trash"></i> 
                                                    <span class="d-none d-md-inline ms-1">Delete</span>
                                                </asp:LinkButton>
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="modal fade" id="adminModal" tabindex="-1" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow-lg">
                <div class="modal-header bg-cabuyao-green text-white">
                    <h5 class="modal-title fw-bold"><i class="bi bi-shield-lock me-2"></i><asp:Literal ID="litModalTitle" runat="server">Add Admin</asp:Literal></h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                
                <asp:UpdatePanel ID="upModal" runat="server">
                    <ContentTemplate>
                        <div class="modal-body p-4">
                            <asp:HiddenField ID="hfAdminID" runat="server" />
                            
                            <asp:Panel ID="pnlModalAlert" runat="server" Visible="false" CssClass="modal-alert">
                                <i id="iconModalAlert" runat="server" class="bi fs-5 me-3"></i>
                                <div>
                                    <asp:Label ID="lblModalAlert" runat="server" CssClass="small fw-bold"></asp:Label>
                                </div>
                            </asp:Panel>

                            <div class="mb-3">
                                <label class="form-label fw-bold small text-secondary">Username</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="bi bi-person"></i></span>
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control custom-input" placeholder="Enter unique username"></asp:TextBox>
                                </div>
                            </div>
                            
                            <hr class="text-muted my-4" />

                            <div class="mb-3">
                                <label class="form-label fw-bold small text-secondary">
                                    <asp:Literal ID="litPasswordLabel" runat="server">Password</asp:Literal>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="bi bi-key"></i></span>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control custom-input" TextMode="Password" placeholder="Enter password"></asp:TextBox>
                                </div>
                                <small id="smPasswordHint" runat="server" class="text-muted d-block mt-1" visible="false">Leave blank to keep existing password.</small>
                            </div>

                            <div class="mb-2">
                                <label class="form-label fw-bold small text-secondary">Confirm Password</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="bi bi-key-fill"></i></span>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control custom-input" TextMode="Password" placeholder="Re-type password"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="modal-footer bg-light border-0">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <asp:Button ID="btnSaveAdmin" runat="server" Text="Save Account" CssClass="btn btn-success fw-bold px-4" OnClick="btnSaveAdmin_Click" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content border-0 shadow-lg">
                <asp:UpdatePanel ID="upDeleteModal" runat="server">
                    <ContentTemplate>
                        <div class="modal-body text-center p-4">
                            <asp:HiddenField ID="hfDeleteAdminID" runat="server" />
                            <i class="bi bi-exclamation-circle text-danger display-4 d-block mb-3"></i>
                            <h5 class="fw-bold mb-2">Delete Admin?</h5>
                            <p class="text-muted small mb-4">Are you sure you want to completely remove this admin account? This action cannot be undone.</p>
                            
                            <div class="d-flex justify-content-center gap-2">
                                <button type="button" class="btn btn-light fw-bold px-4" data-bs-dismiss="modal">Cancel</button>
                                <asp:Button ID="btnConfirmDelete" runat="server" Text="Yes, Delete" CssClass="btn btn-danger fw-bold px-4" OnClick="btnConfirmDelete_Click" />
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function hideGlobalAlert() {
            var alertId = '<%= pnlGlobalAlert.ClientID %>';
            var alertEl = document.getElementById(alertId);
            
            // If the alert exists and is visible
            if (alertEl && alertEl.style.display !== 'none') {
                setTimeout(function () {
                    // Bootstrap 5 fade out mechanics
                    alertEl.classList.remove('show');
                    setTimeout(() => alertEl.style.display = 'none', 150); // wait for fade transition
                }, 5000); // 5 seconds
            }
        }

        // Run on initial load
        document.addEventListener("DOMContentLoaded", hideGlobalAlert);

        // Re-bind the function after an ASP.NET UpdatePanel partial postback
        if (typeof Sys !== 'undefined') {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(hideGlobalAlert);
        }
    </script>
</asp:Content>