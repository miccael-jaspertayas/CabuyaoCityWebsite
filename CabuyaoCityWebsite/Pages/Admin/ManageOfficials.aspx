<%@ Page Title="Manage Officials" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageOfficials.aspx.cs" Inherits="CabuyaoCityWebsite.Pages.Admin.ManageOfficials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">City Directory</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/Admin/ManageOfficials.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center mb-4 gap-3">
        <h3 class="fw-bold text-cabuyao-green m-0">Officials Directory</h3>
        
        <div class="input-group" style="max-width: 400px;">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" Placeholder="Search official or barangay..."></asp:TextBox>
            <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-cabuyao-green" OnClick="btnSearch_Click">
                <i class="bi bi-search"></i> Search
            </asp:LinkButton>
            <asp:LinkButton ID="btnClear" runat="server" CssClass="btn btn-outline-secondary" OnClick="btnClear_Click" ToolTip="Clear Search">
                <i class="bi bi-x-lg"></i>
            </asp:LinkButton>
        </div>
    </div>

    <asp:UpdatePanel ID="upDirectory" runat="server">
        <ContentTemplate>
            
            <h5 class="fw-bold text-secondary mb-3 border-bottom pb-2">City Officials</h5>
            <div class="admin-card bg-white p-0 shadow-sm mb-5 overflow-hidden">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="small text-uppercase">
                            <tr>
                                <th class="ps-4">Official Name & Position</th>
                                <th>Contact Number</th>
                                <th>Email Address</th>
                                <th class="text-end pe-4">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptCityOfficials" runat="server" OnItemCommand="rptOfficials_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td class="ps-4">
                                            <div class="fw-bold text-dark fs-6"><%# Eval("FirstName") %> <%# Eval("LastName") %> <%# Eval("Suffix") %></div>
                                            <div class="small text-muted"><%# Eval("Position") %></div>
                                        </td>
                                        <td><i class="bi bi-telephone-fill text-muted me-2 small"></i><%# Eval("ContactNumber").ToString() == "" ? "<span class='text-muted fst-italic'>Not set</span>" : Eval("ContactNumber") %></td>
                                        <td><i class="bi bi-envelope-fill text-muted me-2 small"></i><%# Eval("Email").ToString() == "" ? "<span class='text-muted fst-italic'>Not set</span>" : Eval("Email") %></td>
                                        <td class="text-end pe-4">
                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditOfficial" CommandArgument='<%# Eval("OfficialID") %>' CssClass="btn btn-sm-custom btn-outline-cabuyao btn-edit-alt fw-bold px-3">
                                                <i class="bi bi-pencil-square me-1"></i> Edit Contact
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <tr id="trNoCity" runat="server" visible="false">
                                <td colspan="4" class="text-center py-5 text-muted">
                                    <i class="bi bi-search fs-1 d-block mb-2 opacity-25"></i>
                                    No city officials found.
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <h5 class="fw-bold text-secondary mb-3 border-bottom pb-2">Barangay Officials</h5>
            
            <asp:Repeater ID="rptBarangays" runat="server" OnItemDataBound="rptBarangays_ItemDataBound" OnItemCommand="rptBarangays_ItemCommand">
                <ItemTemplate>
                    <div class="admin-card bg-white p-0 shadow-sm mb-4 overflow-hidden">
                        
                        <div class="p-3 px-4 d-flex flex-column flex-md-row justify-content-between align-items-md-center border-bottom gap-2">
                            <div>
                                <h5 class="fw-bold m-0 text-dark">Brgy. <%# Eval("BarangayName") %></h5>
                                <div class="small mt-1 text-secondary">
                                    <span class="me-3"><i class="bi bi-telephone-fill me-1"></i> <%# Eval("Landline").ToString() == "" ? "N/A" : Eval("Landline") %></span>
                                    <span><i class="bi bi-phone-fill me-1"></i> <%# Eval("MobileNumber").ToString() == "" ? "N/A" : Eval("MobileNumber") %></span>
                                </div>
                            </div>
                            <asp:LinkButton ID="btnEditBrgy" runat="server" CommandName="EditBrgy" CommandArgument='<%# Eval("BarangayID") %>' CssClass="btn btn-sm btn-outline-cabuyao fw-bold">
                                <i class="bi bi-building-gear me-1"></i> Edit Barangay Info
                            </asp:LinkButton>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <tbody>
                                    <asp:Repeater ID="rptBrgyOfficials" runat="server" OnItemCommand="rptOfficials_ItemCommand">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="ps-4">
                                                    <div class="fw-bold text-dark fs-6"><%# Eval("FirstName") %> <%# Eval("LastName") %> <%# Eval("Suffix") %></div>
                                                    <div class="small text-muted"><%# Eval("Position") %></div>
                                                </td>
                                                <td><i class="bi bi-telephone-fill text-muted me-2 small"></i><%# Eval("ContactNumber").ToString() == "" ? "<span class='text-muted fst-italic'>Not set</span>" : Eval("ContactNumber") %></td>
                                                <td><i class="bi bi-envelope-fill text-muted me-2 small"></i><%# Eval("Email").ToString() == "" ? "<span class='text-muted fst-italic'>Not set</span>" : Eval("Email") %></td>
                                                <td class="text-end pe-4">
                                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditOfficial" CommandArgument='<%# Eval("OfficialID") %>' CssClass="btn btn-sm-custom btn-outline-cabuyao btn-edit-alt fw-bold px-3">
                                                        <i class="bi bi-pencil-square me-1"></i> Edit Contact
                                                    </asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            
            <div id="divNoBarangays" runat="server" visible="false" class="alert alert-secondary text-center py-4">
                <i class="bi bi-search fs-1 d-block mb-2 opacity-25"></i>
                No barangays or matching officials found.
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="modal fade" id="officialModal" tabindex="-1" clientidmode="Static" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <asp:UpdatePanel ID="upOfficialModal" runat="server">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header bg-cabuyao-green text-white">
                            <h5 class="modal-title fw-bold"><i class="bi bi-person-lines-fill me-2"></i>Update Official Contact</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body p-4">
                            <asp:HiddenField ID="hfOfficialID" runat="server" />
                        
                            <div class="bg-light p-3 rounded mb-4">
                                <asp:Label ID="lblOfficialName" runat="server" CssClass="d-block fw-bold fs-5 text-dark"></asp:Label>
                                <asp:Label ID="lblOfficialPosition" runat="server" CssClass="d-block small text-secondary"></asp:Label>
                            </div>

                            <asp:Panel ID="pnlOfficialAlert" runat="server" Visible="false" CssClass="modal-alert">
                                <i id="iconOfficialAlert" runat="server" class="bi fs-5 me-3"></i>
                                <div><asp:Label ID="lblOfficialAlertMessage" runat="server" CssClass="small fw-bold"></asp:Label></div>
                            </asp:Panel>

                            <div class="mb-3">
                                <label class="form-label fw-bold small text-secondary">Contact Number <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="bi bi-telephone"></i></span>
                                    <asp:TextBox ID="txtContactNumber" runat="server" CssClass="form-control custom-input" placeholder="e.g. 0912 345 6789"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="mb-2">
                                <label class="form-label fw-bold small text-secondary">Email Address <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="bi bi-envelope"></i></span>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control custom-input" placeholder="e.g. official@cabuyaocity.gov.ph"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer bg-light border-0">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <asp:Button ID="btnSaveOfficial" runat="server" Text="Save Changes" CssClass="btn btn-success fw-bold px-4" OnClick="btnSaveOfficial_Click" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="brgyModal" tabindex="-1" clientidmode="Static" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered">
            <asp:UpdatePanel ID="upBrgyModal" runat="server">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header bg-warning text-dark border-0">
                            <h5 class="modal-title fw-bold"><i class="bi bi-building me-2"></i>Update Barangay Contact</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body p-4">
                            <asp:HiddenField ID="hfBrgyID" runat="server" />
                        
                            <div class="bg-light p-3 rounded mb-4 border border-start border-4 border-warning text-center">
                                <asp:Label ID="lblBrgyName" runat="server" CssClass="d-block fw-bold fs-5 text-dark"></asp:Label>
                            </div>

                            <asp:Panel ID="pnlBrgyAlert" runat="server" Visible="false" CssClass="modal-alert">
                                <i id="iconBrgyAlert" runat="server" class="bi fs-5 me-3"></i>
                                <div><asp:Label ID="lblBrgyAlertMessage" runat="server" CssClass="small fw-bold"></asp:Label></div>
                            </asp:Panel>

                            <div class="mb-3">
                                <label class="form-label fw-bold small text-secondary">Landline Number <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="bi bi-telephone"></i></span>
                                    <asp:TextBox ID="txtBrgyLandline" runat="server" CssClass="form-control custom-input" placeholder="e.g. (049) 123-4567"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="mb-2">
                                <label class="form-label fw-bold small text-secondary">Mobile Number <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light"><i class="bi bi-phone"></i></span>
                                    <asp:TextBox ID="txtBrgyMobile" runat="server" CssClass="form-control custom-input" placeholder="e.g. 0912 345 6789"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer bg-light border-0">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <asp:Button ID="btnSaveBrgyInfo" runat="server" Text="Save Changes" CssClass="btn btn-warning text-dark fw-bold px-4" OnClick="btnSaveBrgyInfo_Click" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

</asp:Content>