<%@ Page Title="Officials" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Officials.aspx.cs" Inherits="CabuyaoCityWebsite.Pages.Officials" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/Officials.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="OfficialsHeroContent" ContentPlaceHolderID="HeroContent" runat="server">
    <section class="officials-hero text-center text-white d-flex flex-column justify-content-center">
        <div class="container pt-5">
            <h1 class="display-4 fw-bold">Government Officials</h1>
            <p class="lead mb-0">Meet the dedicated leaders serving our community</p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="OfficialsContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        
        <%-- Executive Officials Section --%>
        <div class="row justify-content-center g-4 mb-5">
            <div class="col-12 mb-2">
                <h2 class="section-title">Executive Officials</h2>
            </div>
            
            <asp:Repeater ID="rptExecutive" runat="server">
                <ItemTemplate>
                    <div class="col-12 col-xl-6 d-flex">
                        <div class="card official-card exec-card h-100 w-100" data-bs-toggle="modal" data-bs-target="#contactModal" 
                             data-name="HON. <%# Eval("FirstName") %> <%# Eval("LastName") %> <%# Eval("Suffix") %>" 
                             data-position="<%# Eval("Position") %>" 
                             data-phone='<%# Eval("ContactNumber") == DBNull.Value || string.IsNullOrEmpty(Eval("ContactNumber").ToString()) ? "N/A" : Eval("ContactNumber") %>' 
                             data-email="<%# Eval("Email") %>"
                             data-img="<%# GetImagePath(Eval("ImageFileName")) %>">
                            
                            <div class="row g-0 align-items-stretch h-100">
                                <div class="col-12 col-md-4 exec-img-col">
                                    <div class="official-img-container h-100">
                                        <img src='<%# GetImagePath(Eval("ImageFileName")) %>' 
                                             class="img-fluid h-100 w-100" 
                                             alt="Official Photo" 
                                             style="object-fit: cover;">
                                    </div>
                                </div>
                                <div class="col-12 col-md-8">
                                    <div class="card-body p-4 h-100 d-flex flex-column justify-content-center">
                                        <h4 class="fw-bold mb-1 exec-name text-uppercase">HON. <%# Eval("FirstName") %> <%# Eval("LastName") %> <%# Eval("Suffix") %></h4>
                                        <h6 class="text-cabuyao-gold fw-bold mb-3"><%# Eval("Position") %></h6>
                                        <div class="text-muted mb-0 official-details-list small">
                                            <%# Eval("Details") %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <%-- Sangguniang Panlungsod Section --%>
        <div class="row g-4 mb-5 justify-content-center">
            <div class="col-12 mb-4">
                <h2 class="section-title">Sangguniang Panlungsod</h2>
                <div class="mx-auto"></div>
            </div>
                
            <asp:Repeater ID="rptCouncilors" runat="server">
                <ItemTemplate>
                    <div class="col-xl-2-4 col-lg-3 col-md-4 col-sm-6">
                        <div class="card official-card h-100" data-bs-toggle="modal" data-bs-target="#contactModal"
                             data-name="HON. <%# Eval("FirstName") %> <%# Eval("LastName") %>"
                             data-position="<%# Eval("Position") %>"
                             data-phone='<%# Eval("ContactNumber") == DBNull.Value || string.IsNullOrEmpty(Eval("ContactNumber").ToString()) ? "N/A" : Eval("ContactNumber") %>'
                             data-email="<%# Eval("Email") %>"
                             data-img='<%# "../Images/Officials/City/" + (Eval("ImageFileName") == DBNull.Value ? "official-placeholder.png" : Eval("ImageFileName")) %>'>
                            
                            <div class="official-img-container small-img">
                                <img src='<%# "../Images/Officials/City/" + (Eval("ImageFileName") == DBNull.Value ? "official-placeholder.png" : Eval("ImageFileName")) %>' 
                                     class="card-img-top" alt="Council Member">
                            </div>
                            <div class="card-body text-center p-3">
                                <h6 class="fw-bold mb-1 text-uppercase">Hon. <%# Eval("FirstName") %> <%# Eval("LastName") %></h6>
                                <small class="text-muted d-block"><%# Eval("Position") %></small>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <%-- Modal --%>
        <div class="modal fade" id="contactModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-md"> 
                <div class="modal-content border-0 shadow">
                    <div class="modal-header border-0 pb-0" style="border-top: 5px solid var(--cabuyao-green, #006600);">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center pt-1 pb-4 px-4">
                        <div class="modal-profile-img-wrapper mb-3">
                            <img src="#" id="modalImg" class="rounded-circle shadow-sm border border-2 border-white" alt="Official">
                        </div>

                        <h5 class="fw-bold mb-1 text-uppercase" id="modalName">Name</h5>
                        <p class="text-cabuyao-gold fw-bold mb-4" id="modalPosition" style="font-size: 0.9rem;">Position</p>
                        
                        <div class="text-start bg-light p-3 rounded">
                            <div class="d-flex align-items-center mb-3">
                                <i class="fas fa-phone-alt me-3" style="color: var(--cabuyao-green, #006600);"></i>
                                <span id="modalPhone" class="text-muted small">Phone</span>
                            </div>
                            <div class="d-flex align-items-center">
                                <i class="fas fa-envelope me-3" style="color: var(--cabuyao-green, #006600);"></i>
                                <a href="#" id="modalEmail" class="text-muted small text-decoration-none text-break">Email</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var contactModal = document.getElementById('contactModal');

            contactModal.addEventListener('show.bs.modal', function (event) {
                // The card that triggered the modal
                var button = event.relatedTarget;

                // Extract info from data attributes
                var name = button.getAttribute('data-name');
                var position = button.getAttribute('data-position');
                var phone = button.getAttribute('data-phone');
                var email = button.getAttribute('data-email');
                var img = button.getAttribute('data-img');

                // Update the modal's text content
                contactModal.querySelector('#modalName').textContent = name;
                contactModal.querySelector('#modalPosition').textContent = position;
                contactModal.querySelector('#modalPhone').textContent = phone;
                contactModal.querySelector('#modalImg').src = img;

                // Update email text and href
                var emailElement = contactModal.querySelector('#modalEmail');
                emailElement.textContent = email;
                emailElement.href = "mailto:" + email;
            });
        });
    </script>
</asp:Content>