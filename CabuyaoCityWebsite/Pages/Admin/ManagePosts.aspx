<%@ Page Title="Manage Posts" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManagePosts.aspx.cs" Inherits="CabuyaoCityWebsite.Pages.Admin.ManagePosts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Admin Panel</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/Admin/ManagePosts.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel ID="upManagePosts" runat="server">
        <ContentTemplate>

            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="fw-bold text-cabuyao-green m-0">News & Announcements</h3>
                
                <asp:LinkButton ID="btnAddPost" runat="server" CssClass="btn-green btn btn-success fw-bold shadow-sm" OnClick="btnAddPost_Click">
                    <i class="bi bi-plus-lg me-2"></i> Create New Post
                </asp:LinkButton>
            </div>

            <%-- Alert Panel --%>
            <asp:Panel ID="pnlAlert" runat="server" Visible="false" role="alert">
                <asp:Label ID="lblAlertMessage" runat="server"></asp:Label>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </asp:Panel>

            <div class="admin-card bg-white p-0 overflow-hidden shadow-sm">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="table-light text-secondary small text-uppercase">
                            <tr>
                                <th class="ps-4">Image</th>
                                <th>Title & Category</th>
                                <th>Date Created</th>
                                <th class="text-end pe-4">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptPosts" runat="server" OnItemCommand="rptPosts_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td class="ps-4">
                                            <%-- Using VersionTag here forces the browser to refresh the image if it was updated --%>
                                            <img src='<%# ResolveUrl("~/Images/NewsAnnouncement/" + Eval("ImageFileName")) %>?v=<%# Eval("VersionTag") %>' 
                                                 class="post-thumbnail shadow-sm" alt="Post Image" 
                                                 onerror="this.src='../../Images/Master/placeholder.png';" />
                                        </td>
                                        <td>
                                            <div class="fw-bold text-dark text-truncate" style="max-width: 350px;">
                                                <%# Eval("Title") %>
                                            </div>
                                            <span class="badge bg-secondary mt-1"><%# Eval("Category") %></span>
                                        </td>
                                        <td>
                                            <%# Convert.ToDateTime(Eval("DateCreated")).ToString("MMM dd, yyyy") %>
                                        </td>
                                        <td class="text-end pe-4">
                                            <asp:LinkButton ID="btnEdit" runat="server" 
                                                CommandName="EditPost" 
                                                CommandArgument='<%# Eval("PostID") %>' 
                                                CssClass="btn btn-sm-custom btn-outline-cabuyao btn-edit-alt me-1" 
                                                ToolTip="Edit Post">
                                                <i class="bi bi-pencil-square"></i>
                                            </asp:LinkButton>
    
                                            <asp:LinkButton ID="btnDeletePrompt" runat="server" 
                                                CommandName="DeletePrompt" 
                                                CommandArgument='<%# Eval("PostID") %>' 
                                                CssClass="btn btn-sm-custom btn-outline-danger-custom" 
                                                ToolTip="Delete Post">
                                                <i class="bi bi-trash"></i>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            
                            <asp:PlaceHolder ID="phNoRecords" runat="server" Visible="false">
                                <tr>
                                    <td colspan="4" class="text-center py-5 text-muted">
                                        <i class="bi bi-journal-x fs-1 d-block mb-2 opacity-50"></i>
                                        No posts found. Click "Create New Post" to get started.
                                    </td>
                                </tr>
                            </asp:PlaceHolder>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="modal fade" id="postModal" tabindex="-1" aria-hidden="true" data-bs-backdrop="static">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content border-0 shadow-lg">
                        <div class="modal-header bg-cabuyao-green text-white border-0" style="border-bottom: 3px solid var(--cabuyao-gold, #D4AF37) !important;">
                            <h5 class="modal-title fw-bold" id="modalPostTitle"><asp:Literal ID="litModalTitle" runat="server" Text="Create New Post"></asp:Literal></h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        
                        <div class="modal-body p-4 bg-light">
                            <asp:HiddenField ID="hfPostID" runat="server" />
                            <asp:HiddenField ID="hfExistingImage" runat="server" />

                            <div class="row g-3">
                                <div class="col-md-8">
                                    <label class="form-label fw-bold small text-secondary">Post Title</label>
                                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Enter post title"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label fw-bold small text-secondary">Category</label>
                                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="News" Value="News"></asp:ListItem>
                                        <asp:ListItem Text="Announcement" Value="Announcement"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-12">
                                    <label class="form-label fw-bold small text-secondary">Content</label>
                                    <asp:TextBox ID="txtContent" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="6" placeholder="Write the full details here..."></asp:TextBox>
                                </div>
                                <div class="col-12">
                                    <label class="form-label fw-bold small text-secondary">Cover Image</label>
                                    <div class="custom-file-upload bg-white">
                                        <i class="bi bi-cloud-arrow-up fs-2 text-cabuyao-green d-block mb-2"></i>
                                        <asp:FileUpload ID="fileUploadImage" runat="server" CssClass="form-control" accept="image/png, image/jpeg, image/jpg" />
                                        <small class="text-muted mt-2 d-block">
                                            <asp:Literal ID="litImageNote" runat="server" Text="Upload a high-quality JPG or PNG."></asp:Literal>
                                        </small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer border-0 bg-light">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <asp:Button ID="btnSavePost" runat="server" Text="Save Post" CssClass="btn btn-success fw-bold px-4" OnClick="btnSavePost_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-sm">
                    <div class="modal-content border-0 shadow">
                        <div class="modal-header bg-danger text-white border-0">
                            <h5 class="modal-title fw-bold"><i class="bi bi-exclamation-triangle-fill me-2"></i>Confirm Delete</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-center p-4">
                            <asp:HiddenField ID="hfDeletePostID" runat="server" />
                            <asp:HiddenField ID="hfDeleteImageName" runat="server" />
                            <p class="mb-0 fs-5">Are you sure you want to delete this post?</p>
                            <p class="text-muted small mt-2">This action cannot be undone.</p>
                        </div>
                        <div class="modal-footer border-0 justify-content-center bg-light">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <asp:Button ID="btnConfirmDelete" runat="server" Text="Yes, Delete" CssClass="btn btn-danger fw-bold" OnClick="btnConfirmDelete_Click" />
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSavePost" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>