<%@ Page Title="View Project Sales Cycle :: FEA" Language="C#" MasterPageFile="~/Account/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ViewProjectSalesCycle.aspx.cs" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">
        <div class="main-page signup-page">
            <h3 class="title1">Projects Details
            </h3>
            <asp:Label ID="lblGMsg" runat="server" ForeColor="red"></asp:Label>

            <div class="sign-up-row widget-shadow">

                <div class="form-body" data-example-id="simple-form-inline">
                    <div class="form-inline">
                        <div class="form-group">
                            <asp:Repeater ID="r1" runat="server">
                                <ItemTemplate>
                                    <p style="font-size: 40px; color: #000000">Project Name: <%# Eval("Name") %></p>
                                    <p style="color: #808080; font-size: 20px">Company Name: <%# Eval("CompanyName") %></p>


                                </ItemTemplate>
                            </asp:Repeater>

                            <p style="color: #808080; font-size: 20px">
                                Latest Stage:                        
                                    <asp:Label ID="lblLatestStage" runat="server" ForeColor="red" Font-Bold="true" Text=""></asp:Label>
                            </p>
                        </div>
                        <hr />
                        <h2 style="text-align: center">Project Stage Details</h2>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Date
                                    <br />
                                        <r style="font-size: smaller; color: grey">(mm/dd/yyyy)</r>
                                    </th>
                                    <th>Stage<br />
                                        &nbsp;</th>
                                    <th>POC<br />
                                        &nbsp;</th>


                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Order" runat="server" OnItemCommand="Order_ItemCommand">
                                    <ItemTemplate>
                                        <div class="col-md-12 switch-rightt">
                                            <div class="switch-right-grid">
                                                <div class="switch-right-grid1">
                                                    <tr>
                                                        <th scope="row">
                                                            <asp:Label ID="lblDate" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("DateCreated") %>' /></b>
                                                        </th>
                                                        <th scope="row">
                                                            <asp:Label ID="lblStage" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Stage") %>' /></b>
                                                        </th>
                                                        <th scope="row">
                                                            <asp:Label ID="lblPOC" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("ContactName") %>' /></b>
                                                        </th>
                                                        <th scope="row">
                                                            <asp:Button ID="lnkView" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="view" Text="Discuss" CssClass="btn btn-success" />
                                                        </th>
                                                    </tr>
                                                </div>
                                            </div>

                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                        <br />
                        <br />
                        <h2 style="text-align: center">Team Lead Details</h2>
                        <br />

                        <table class="table table-hover">
                            <thead>
                                <tr>
                                   <th>Type</th>
                                    <th>Team Lead Email</th>
                                    <th>Team Lead Name</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="TeamLead" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-12 switch-rightt">
                                            <div class="switch-right-grid">
                                                <div class="switch-right-grid1">
                                                    <tr>
                                                        <th scope="row">
                                                            <asp:Label ID="lblTeamLead" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='Team Lead' /></b>
                                                        </th>
                                                        <th scope="row">
                                                            <asp:Label ID="lblName" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("TeamLeadEmail") %>' /></b>
                                                        </th>
                                                        <th scope="row">
                                                            <asp:Label ID="Label2" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("TeamLeadName") %>' /></b>
                                                        </th>
                                                    </tr>
                                                </div>
                                            </div>

                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                                <asp:Repeater ID="TeamMember" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-12 switch-rightt">
                                            <div class="switch-right-grid">
                                                <div class="switch-right-grid1">
                                                    <tr>
                                                        <th scope="row">
                                                            <asp:Label ID="Label1" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='Team Member' /></b>
                                                        </th>
                                                        <th scope="row">
                                                            <asp:Label ID="lblName" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("TeamMemberEmail") %>' /></b>
                                                        </th>
                                                        <th scope="row">
                                                            <asp:Label ID="Label2" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("TeamMemberName") %>' /></b>
                                                        </th>
                                                    </tr>
                                                </div>
                                            </div>

                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>


                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

