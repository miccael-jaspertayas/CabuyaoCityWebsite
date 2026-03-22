<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CabuyaoCityWebsite.Pages.Admin.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Admin Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"/>
    <link href="~/Styles/Admin/Login.css" rel="stylesheet" />
</head>
<body class="login-body">
    <form id="form1" runat="server">
        <div class="login-container d-flex align-items-center justify-content-center">
            <div class="login-card shadow-lg p-4 rounded-3">
                
                <div class="text-center mb-4">
                    <%-- Placeholder for your minimalist logo --%>
                    <h2 class="fw-bold login-title">ADMIN PANEL</h2>
                    <p class="text-muted small">City of Cabuyao Website Management</p>
                </div>

                <%-- Modern Alert Panel --%>
                <asp:Panel ID="pnlAlert" runat="server" Visible="false" role="alert">
                    <asp:Label ID="lblAlertMessage" runat="server"></asp:Label>
                </asp:Panel>

                <div class="mb-3">
                    <label class="form-label fw-bold small text-secondary">Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control custom-input" placeholder="Enter username"></asp:TextBox>
                </div>

                <div class="mb-4">
                    <label class="form-label fw-bold small text-secondary">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control custom-input" TextMode="Password" placeholder="Enter password"></asp:TextBox>
                </div>

                <div class="d-grid gap-2">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-login btn-lg" />
                </div>

                <div class="text-center mt-4">
                    <a href="../Home.aspx" class="text-decoration-none small text-success return-link">
                        <i class="bi bi-arrow-left-circle-fill me-1"></i> Return to Website
                    </a>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>