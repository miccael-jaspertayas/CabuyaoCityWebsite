<%@ Page Title="Manage Departments" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageDepartments.aspx.cs" Inherits="CabuyaoCityWebsite.Pages.Admin.ManageDepartments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Manage Departments</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/Admin/ManageDepartments.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold text-cabuyao-green m-0">Department Directory</h3>
    </div>

    <asp:UpdatePanel ID="upDepartments" runat="server">
        <ContentTemplate>
            
            <div class="admin-card bg-white p-0 shadow-sm overflow-hidden">
                
                <div class="p-4 bg-white border-bottom">
                    <div class="row align-items-center g-3">
                        <div class="col-lg-8">
                            <ul class="nav nav-tabs dept-tabs border-0 m-0 flex-column flex-lg-row nav-justified">
                                <li class="nav-item">
                                    <asp:LinkButton ID="tabLocal" runat="server" CssClass="nav-link active" OnClick="Tab_Click" CommandArgument="Local"><i class="bi bi-building me-2"></i>Local Departments</asp:LinkButton>
                                </li>
                                <li class="nav-item">
                                    <asp:LinkButton ID="tabNational" runat="server" CssClass="nav-link" OnClick="Tab_Click" CommandArgument="National"><i class="bi bi-bank me-2"></i>National Agencies</asp:LinkButton>
                                </li>
                                <li class="nav-item">
                                    <asp:LinkButton ID="tabSchool" runat="server" CssClass="nav-link" OnClick="Tab_Click" CommandArgument="School"><i class="bi bi-mortarboard me-2"></i>Schools</asp:LinkButton>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-4">
                            <div class="input-group">
                                <span class="input-group-text bg-light border-end-0"><i class="bi bi-search"></i></span>
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control border-start-0 bg-light" Placeholder="Search department name..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <asp:HiddenField ID="hfActiveCategory" runat="server" Value="Local" />

                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0 table-fixed-layout">
                        <thead class="table-light small text-uppercase">
                            <tr>
                                <th class="ps-4">Department / Office</th>
                                <th>Contact Information</th>
                                <th class="text-end pe-4">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptDepartments" runat="server" OnItemCommand="rptDepartments_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td class="ps-4">
                                            <div class="d-flex align-items-center">
                                                <div class="dept-icon shadow-sm me-3 flex-shrink-0">
                                                    <i class='<%# GetCategoryIcon() %>'></i>
                                                </div>
                                                <div>
                                                    <div class="fw-bold text-dark fs-6"><%# Eval("DepartmentName") %></div>
                                                    <%-- Only show SubGroup badge if it exists (mostly for Local) --%>
                                                    <asp:Label ID="lblSubGroup" runat="server" 
                                                               CssClass="badge subgroup-badge mt-1" 
                                                               Visible='<%# Eval("SubGroup") != DBNull.Value && !string.IsNullOrEmpty(Eval("SubGroup").ToString()) %>'>
                                                        <%# Eval("SubGroup") %>
                                                    </asp:Label>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="text-muted small mb-1"><i class="bi bi-telephone-fill me-2"></i><%# string.IsNullOrEmpty(Eval("Landline").ToString()) ? "N/A" : Eval("Landline") %></div>
                                            <div class="text-muted small"><i class="bi bi-phone-fill me-2"></i><%# string.IsNullOrEmpty(Eval("MobileNumber").ToString()) ? "N/A" : Eval("MobileNumber") %></div>
                                        </td>
                                        <td class="text-end pe-4">
                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditContact" CommandArgument='<%# Eval("DeptID") %>' CssClass="btn btn-sm-custom btn-outline-cabuyao fw-bold px-3">
                                                <i class="bi bi-pencil-square me-1"></i> Edit Contacts
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                            <asp:PlaceHolder ID="phNoRecords" runat="server" Visible="false">
                                <tr>
                                    <td colspan="3" class="text-center py-5 text-muted">
                                        <i class="bi bi-search fs-1 d-block mb-2 opacity-25"></i>
                                        No departments found matching your search.
                                    </td>
                                </tr>
                            </asp:PlaceHolder>
                        </tbody>
                    </table>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="modal fade" id="editDeptModal" tabindex="-1" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow-lg">
                <div class="modal-header bg-cabuyao-green text-white">
                    <h5 class="modal-title fw-bold"><i class="bi bi-journal-text me-2"></i>Edit Contact Info</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                
                <asp:UpdatePanel ID="upModal" runat="server">
                    <ContentTemplate>
                        <div class="modal-body p-4">
                            <asp:HiddenField ID="hfEditDeptID" runat="server" />
                            
                            <asp:Panel ID="pnlModalAlert" runat="server" Visible="false" CssClass="modal-alert">
                                <i id="iconModalAlert" runat="server" class="bi fs-5 me-3"></i>
                                <div>
                                    <asp:Label ID="lblModalAlert" runat="server" CssClass="small fw-bold"></asp:Label>
                                </div>
                            </asp:Panel>

                            <div class="contact-box mb-4">
                                <small class="text-muted text-uppercase fw-bold">Department Name</small>
                                <div class="fw-bold text-dark fs-5"><asp:Literal ID="litDeptName" runat="server"></asp:Literal></div>
                                <div class="small text-secondary"><asp:Literal ID="litSubGroup" runat="server"></asp:Literal></div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold small text-secondary">Landline / Extension</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="bi bi-telephone"></i></span>
                                    <asp:TextBox ID="txtLandline" runat="server" CssClass="form-control" placeholder="(049) 554-9780 LOC. XXX"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label fw-bold small text-secondary">Mobile Number</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="bi bi-phone"></i></span>
                                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="09XX XXX XXXX"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer bg-light border-0">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <asp:Button ID="btnSaveContact" runat="server" Text="Save Changes" CssClass="btn btn-success fw-bold px-4" OnClick="btnSaveContact_Click" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>