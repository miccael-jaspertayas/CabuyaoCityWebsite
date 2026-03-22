<%@ Page Title="Messages" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CabuyaoCityWebsite.Pages.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Messages</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../../Styles/Admin/Dashboard.css" rel="stylesheet"/>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="fw-bold text-cabuyao-green m-0">User Messages</h3>
    </div>

    <div class="admin-card bg-white p-3 mb-4">
        <div class="row g-3">
            <div class="col-md-6">
                <div class="input-group">
                    <span class="input-group-text bg-light border-end-0"><i class="bi bi-search"></i></span>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control border-start-0 bg-light" placeholder="Search name or email..."></asp:TextBox>
                </div>
            </div>
            <div class="col-md-4">
                <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="form-select bg-light">
                    <asp:ListItem Text="All Statuses" Value=""></asp:ListItem>
                    <asp:ListItem Text="New" Value="New"></asp:ListItem>
                    <asp:ListItem Text="Read" Value="Read"></asp:ListItem>
                    <asp:ListItem Text="Replied" Value="Replied"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 ms-auto">
                <asp:Button ID="btnFilter" runat="server" Text="Apply Filter" CssClass="btn-green btn-cabuyao-green btn-secondary w-100 fw-bold" OnClick="btnFilter_Click" />
            </div>
        </div>
    </div>

    <div class="admin-card bg-white p-0 mb-5 overflow-hidden shadow-sm">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-light small text-uppercase">
                    <tr>
                        <th class="ps-4">Sender Info</th>
                        <th>Message</th>
                        <th>Date Received</th>
                        <th>Status</th>
                        <th class="text-end pe-4">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptMessages" runat="server" OnItemCommand="rptMessages_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td class="ps-4">
                                    <div class="fw-bold text-dark"><%# Eval("SenderName") %></div>
                                    <div class="small text-muted"><i class="bi bi-envelope me-1"></i><%# Eval("SenderEmail") %></div>
                                    <div class="small text-muted"><i class="bi bi-telephone me-1"></i><%# Eval("SenderPhoneNumber") %></div>
                                </td>
                                <td style="max-width: 300px;">
                                    <div class="text-truncate" title='<%# Eval("MessageBody") %>'>
                                        <%# Eval("MessageBody") %>
                                    </div>
                                </td>
                                <td>
                                    <%-- Formats SQL DateTime cleanly --%>
                                    <%# Convert.ToDateTime(Eval("DateReceived")).ToString("MMM dd, yyyy") %><br />
                                    <small class="text-muted"><%# Convert.ToDateTime(Eval("DateReceived")).ToString("hh:mm tt") %></small>
                                </td>
                                <td>
                                    <span class='badge rounded-pill <%# GetStatusBadgeClass(Eval("Status").ToString()) %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </td>
                                <td class="text-end pe-4">
                                    <div class="dropdown">
                                        <button class="btn btn-light btn-sm rounded-circle" type="button" data-bs-toggle="dropdown">
                                            <i class="bi bi-three-dots-vertical"></i>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-end shadow-sm border-0">
                                            <li><asp:LinkButton ID="btnMarkRead" runat="server" CommandName="MarkRead" CommandArgument='<%# Eval("MessageID") %>' CssClass="dropdown-item small"><i class="bi bi-envelope-open me-2 text-primary"></i>Mark as Read</asp:LinkButton></li>
                                            <li><asp:LinkButton ID="btnMarkReplied" runat="server" CommandName="MarkReplied" CommandArgument='<%# Eval("MessageID") %>' CssClass="dropdown-item small"><i class="bi bi-check-circle me-2 text-success"></i>Mark as Replied</asp:LinkButton></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><asp:LinkButton ID="btnViewMessage" runat="server" CommandName="ViewMessage" CommandArgument='<%# Eval("MessageID") %>' CssClass="dropdown-item small text-dark"><i class="bi bi-eye me-2"></i>View Full Message</asp:LinkButton></li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                    <asp:PlaceHolder ID="phNoRecords" runat="server" Visible="false">
                        <tr>
                            <td colspan="5" class="text-center py-5 text-muted">
                                <i class="bi bi-inbox fs-1 d-block mb-2 opacity-50"></i>
                                No messages found.
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                </tbody>
            </table>
        </div>
    </div>

    <div class="modal fade" id="viewMessageModal" clientidmode="Static" tabindex="-1" aria-hidden="true" >
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content border-0 shadow-lg">
                <div class="modal-header message-modal-header">
                    <h5 class="modal-title fw-bold"><i class="bi bi-envelope-paper me-2"></i>Message Details</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    
                    <div class="message-meta-box p-3 mb-4">
                        <div class="row">
                            <div class="col-md-6 mb-2 mb-md-0">
                                <small class="text-muted text-uppercase fw-bold d-block mb-1">From</small>
                                <div class="fw-bold fs-5 text-dark"><asp:Literal ID="litSenderName" runat="server"></asp:Literal></div>
                                <div><a href="#" id="linkEmail" runat="server" class="text-decoration-none text-success"><i class="bi bi-envelope me-1"></i><asp:Literal ID="litSenderEmail" runat="server"></asp:Literal></a></div>
                                <div class="text-muted"><i class="bi bi-telephone me-1"></i><asp:Literal ID="litSenderPhone" runat="server"></asp:Literal></div>
                            </div>
                            <div class="col-md-6 text-md-end">
                                <small class="text-muted text-uppercase fw-bold d-block mb-1">Received On</small>
                                <div class="text-dark"><asp:Literal ID="litDate" runat="server"></asp:Literal></div>
                                <div class="mt-2">
                                    <span class="badge" id="badgeStatus" runat="server">Status</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <small class="text-muted text-uppercase fw-bold d-block mb-2">Message</small>
                    <div class="message-body-content p-3 bg-white border rounded">
                        <asp:Literal ID="litMessageBody" runat="server"></asp:Literal>
                    </div>
                </div>
                <div class="modal-footer bg-light border-0">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <a href="#" id="btnReplyEmail" runat="server" class="btn btn-success"><i class="bi bi-reply-fill me-1"></i> Reply via Email</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
