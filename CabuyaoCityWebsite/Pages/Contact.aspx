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

            <%-- Tab Contents --%>
            <div class="tab-content rounded-3" id="directoryTabsContent">
                    
                <%-- Local Tab Content --%>
                <div class="tab-pane fade show active" id="local" role="tabpanel" aria-labelledby="local-tab" tabindex="0">
                    <asp:Repeater ID="rptLocalGroups" runat="server" OnItemDataBound="rptLocalGroups_ItemDataBound">
                        <ItemTemplate>
                            <h5 class="fw-bold text-center mt-4 mb-3"><%# Eval("SubGroup") %></h5>
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered bg-white text-center mb-4">
                                    <thead class="table-head">
                                        <tr>
                                            <th>Department/Office</th>
                                            <th>Landline/Extension</th>
                                            <th>Mobile Number</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rptLocalDepartments" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("DepartmentName") %></td>
                                                    <td><%# string.IsNullOrWhiteSpace(Eval("Landline")?.ToString()) ? "<span class='text-muted'>N/A</span>" : Eval("Landline") %></td>
                                                    <td><%# string.IsNullOrWhiteSpace(Eval("MobileNumber")?.ToString()) ? "<span class='text-muted'>N/A</span>" : Eval("MobileNumber") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <%-- National Tab Content --%>
                <div class="tab-pane fade" id="national" role="tabpanel" aria-labelledby="national-tab" tabindex="0">
                    <h5 class="fw-bold text-center mt-4 mb-3">National Agencies</h5>
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered bg-white text-center">
                            <thead class="table-head">
                                <tr>
                                    <th>Department/Office</th>
                                    <th>Landline/Extension</th>
                                    <th>Mobile Number</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptNational" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("DepartmentName") %></td>
                                            <td><%# string.IsNullOrWhiteSpace(Eval("Landline")?.ToString()) ? "<span class='text-muted'>N/A</span>" : Eval("Landline") %></td>
                                            <td><%# string.IsNullOrWhiteSpace(Eval("MobileNumber")?.ToString()) ? "<span class='text-muted'>N/A</span>" : Eval("MobileNumber") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>

                <%-- Barangay Tab Content --%>
                <div class="tab-pane fade" id="barangay" role="tabpanel" aria-labelledby="barangay-tab" tabindex="0">
                    <h5 class="fw-bold text-center mt-4 mb-3">Barangay Directory</h5>
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered bg-white text-center">
                            <thead class="table-head">
                                <tr>
                                    <th>Barangay</th>
                                    <th>Landline/Extension</th>
                                    <th>Mobile Number</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptBarangay" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("BarangayName") %></td>
                                            <td><%# string.IsNullOrWhiteSpace(Eval("Landline")?.ToString()) ? "<span class='text-muted'>N/A</span>" : Eval("Landline") %></td>
                                            <td><%# string.IsNullOrWhiteSpace(Eval("MobileNumber")?.ToString()) ? "<span class='text-muted'>N/A</span>" : Eval("MobileNumber") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>

                <%-- School (Pamantasan ng Cabuyao) Tab Content --%>
                <div class="tab-pane fade" id="school" role="tabpanel" aria-labelledby="school-tab" tabindex="0">
                    <h5 class="fw-bold text-center mt-4 mb-3">Pamantasan ng Cabuyao</h5>
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered bg-white text-center">
                            <thead class="table-head">
                                <tr>
                                    <th>School Name</th>
                                    <th>Landline/Extension</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptSchool" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("DepartmentName") %></td>
                                            <td><%# string.IsNullOrWhiteSpace(Eval("Landline")?.ToString()) ? "<span class='text-muted'>N/A</span>" : Eval("Landline") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>

        <%-- Send Us a Message Section --%>
        <section id="Send-Message" class="mb-5 mt-5">
            <h2 class="section-title">Send Us A Message</h2>

            <asp:UpdatePanel ID="upMessage" runat="server">
                <ContentTemplate>
                    
                    <%-- Modern Alert Panel --%>
                    <asp:Panel ID="pnlAlert" runat="server" Visible="false" role="alert">
                        <asp:Label ID="lblAlertMessage" runat="server"></asp:Label>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </asp:Panel>
                        
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
                                <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" OnClick="btnSendMessage_Click" CssClass="btn btn-success btn-lg px-5 custom-submit-btn rounded-1" />
                            </div>
                        </div>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </section>
    </main>

    <%-- Embedded JavaScript --%>
    <script type="text/javascript">

        function pageLoad() {
            const sendBtn = document.getElementById('<%= btnSendMessage.ClientID %>');
            const termCheck = document.getElementById('<%= chkTerms.ClientID %>');

            if (sendBtn && termCheck) {
                // Set initial state
                sendBtn.disabled = !termCheck.checked;

                // Remove existing listener to prevent duplicates after partial reload, then add it
                termCheck.removeEventListener('change', toggleButton);
                termCheck.addEventListener('change', toggleButton);

                function toggleButton() {
                    sendBtn.disabled = !this.checked;
                }
            }
        }
    </script>
</asp:Content>