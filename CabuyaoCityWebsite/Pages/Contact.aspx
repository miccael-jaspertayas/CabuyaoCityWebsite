<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="CabuyaoCityWebsite.Pages.Contact" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/Contact.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="ContactHeroContent" ContentPlaceHolderID="HeroContent" runat="server">
    <section class="contact-hero text-center text-white d-flex flex-column justify-content-center">
        <div class="container pt-5">
            <h1 class="display-4 fw-bold">Contact Us</h1>
            <p class="lead mb-0">Got questions? Browse the city directory or send us a message</p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="ContactContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="container section-container">
            
            <%-- City Directory Section --%>
            <section id="City-Directory" class="mb-5">
                <h2 class="section-title">City Directory</h2>
                
                <div class="text-center mt-4 mb-4">
                    <h4 class="fw-bold text-success mb-2">Trunk Line (Connecting All Department and Offices)</h4>
                    <div class="trunk-line-box d-inline-block px-5 py-2 fw-bold text-white fs-4 shadow-sm">
                        (049) 554-9780 LOC. ____
                    </div>
                </div>

                <%-- Directory Tabs --%>
                <ul class="nav nav-pills nav-fill gap-3 mb-4 directory-tabs" id="directoryTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="local-tab" data-bs-toggle="pill" data-bs-target="#local" type="button" role="tab" aria-controls="local" aria-selected="true">Local</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="national-tab" data-bs-toggle="pill" data-bs-target="#national" type="button" role="tab" aria-controls="national" aria-selected="false">National</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="barangay-tab" data-bs-toggle="pill" data-bs-target="#barangay" type="button" role="tab" aria-controls="barangay" aria-selected="false">Barangay</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="school-tab" data-bs-toggle="pill" data-bs-target="#school" type="button" role="tab" aria-controls="school" aria-selected="false">School</button>
                    </li>
                </ul>

                <%-- Tab Contents (Placeholders for Database integration) --%>
                <div class="tab-content rounded-3" id="directoryTabsContent">
                    
                    <%-- Local Tab Content --%>
                    <div class="tab-pane fade show active" id="local" role="tabpanel" aria-labelledby="local-tab" tabindex="0">
                        
                        <h5 class="fw-bold text-center mb-3">City Hall Offices</h5>
                        <table class="table table-hover table-bordered bg-white text-center">
                            <thead class="table-head">
                                <tr>
                                    <th>Department/Office</th>
                                    <th>Contact Number</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr><td>Office of the Mayor</td><td>Loc. 101</td></tr>
                                <tr><td>City Administrator's Office</td><td>Loc. 102</td></tr>
                                </tbody>
                        </table>

                        <h5 class="fw-bold text-center mt-4 mb-3">Retail Plaza Building</h5>
                        <table class="table table-hover table-bordered bg-white text-center">
                            <thead class="table-head">
                                <tr>
                                    <th>Department/Office</th>
                                    <th>Contact Number</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr><td>Public Employment Service Office (PESO)</td><td>Loc. 201</td></tr>
                                <tr><td>City Library</td><td>Loc. 202</td></tr>
                                </tbody>
                        </table>

                        <h5 class="fw-bold text-center mt-4 mb-3">Others</h5>
                        <table class="table table-hover table-bordered bg-white text-center">
                            <thead class="table-head">
                                <tr>
                                    <th>Department/Office</th>
                                    <th>Contact Number</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr><td>Cabuyao City Hospital</td><td>(049) 123-4567</td></tr>
                                </tbody>
                        </table>
                    </div>

                    <%-- National Tab Content --%>
                    <div class="tab-pane fade" id="national" role="tabpanel" aria-labelledby="national-tab" tabindex="0">
                        <h5 class="fw-bold text-center mb-3">National Agencies</h5>
                        <table class="table table-hover table-bordered bg-white text-center">
                            <thead class="table-head"><tr><th>Department/Office</th><th>Contact Number</th></tr></thead>
                            <tbody><tr><td>DILG Cabuyao</td><td>Loc. 301</td></tr></tbody>
                        </table>
                    </div>

                    <%-- Barangay Tab Content --%>
                    <div class="tab-pane fade" id="barangay" role="tabpanel" aria-labelledby="barangay-tab" tabindex="0">
                        <h5 class="fw-bold text-center mb-3">Barangay Directory</h5>
                        <table class="table table-hover table-bordered bg-white text-center">
                            <thead class="table-head"><tr><th>Barangay</th><th>Contact Number</th></tr></thead>
                            <tbody><tr><td>Brgy. Sala</td><td>(049) 987-6543</td></tr></tbody>
                        </table>
                    </div>

                    <%-- School Tab Content --%>
                    <div class="tab-pane fade" id="school" role="tabpanel" aria-labelledby="school-tab" tabindex="0">
                        <h5 class="fw-bold text-center mb-3">Public Schools</h5>
                        <table class="table table-hover table-bordered bg-white text-center">
                            <thead class="table-head"><tr><th>School Name</th><th>Contact Number</th></tr></thead>
                            <tbody><tr><td>Cabuyao National High School</td><td>(049) 111-2222</td></tr></tbody>
                        </table>
                    </div>
                </div>
            </section>

            <%-- Send Us a Message Section --%>
            <section id="Send-Message" class="mb-5 mt-5">
                <h2 class="section-title">Send Us A Message</h2>
                
                <div class="mt-4">
                    <div class="row g-3">
                        <div class="col-md-4">
                            <asp:TextBox ID="txtYourName" runat="server" CssClass="form-control custom-input" Placeholder="Your Name"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtYourEmail" runat="server" CssClass="form-control custom-input" TextMode="Email" Placeholder="Your Email"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtYourNumber" runat="server" CssClass="form-control custom-input" Placeholder="Your Phone Number"></asp:TextBox>
                        </div>
                        <div class="col-12">
                            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control custom-input" TextMode="MultiLine" Rows="8" Placeholder="Message/Inquiry"></asp:TextBox>
                        </div>
                        <div class="col-12 mt-3">
                            <div class="form-check d-flex align-items-center">
                                <input type="checkbox" id="chkTerms" runat="server" class="form-check-input me-2 custom-checkbox" />
                                <label class="form-check-label text-muted" for="chkTerms">
                                    I agree to the <strong>Terms & Conditions</strong> of the City of Cabuyao.
                                </label>
                            </div>

                        </div>
                        <div class="col-12 text-center mt-4">
                            <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" CssClass="btn btn-success btn-lg px-5 custom-submit-btn rounded-1"/>
                        </div>
                    </div>
                </div>
            </section>

        </div>
    </main>

    <%-- Embedded JavaScript --%>
    <script type="text/javascript">
        // Basic script placeholder. Bootstrap 5 handles the tabs automatically via data-bs-toggle="pill"
        // You can use this block to initialize form validation or AJAX for your dropdowns/tables in the future.
        document.addEventListener("DOMContentLoaded", function () {
            const sendBtn = document.getElementById('<%= btnSendMessage.ClientID %>');
            const termCheck = document.getElementById('<%= chkTerms.ClientID %>');

            // Example frontend validation: disable button if terms aren't checked
            if (sendBtn && termCheck) {
                sendBtn.disabled = !termCheck.checked;
                termCheck.addEventListener('change', function () {
                    sendBtn.disabled = !this.checked;
                });
            }
        });
    </script>
</asp:Content>