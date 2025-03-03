<%@ Page Title="View Project Sales Cycle :: FEA" Language="C#" MasterPageFile="~/Account/Sales/MasterPage.master" AutoEventWireup="true" CodeFile="ViewProjectSalesCycle.aspx.cs" Inherits="Purchase" %>

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

                            <br />
                            <asp:HiddenField runat="server" ID="hdBalance" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlStage" Display="Dynamic" ErrorMessage="*" ValidationGroup="q1" ForeColor="red" Font-Bold="true"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="ddlStage" runat="server" AutoPostBack="True" class="form-control" Font-Size="Large">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlPOC" Display="Dynamic" ErrorMessage="*" ValidationGroup="q1" ForeColor="red" Font-Bold="true"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="ddlPOC" runat="server" AutoPostBack="True" class="form-control" Font-Size="Large">
                            </asp:DropDownList>
                            <asp:Button ID="btnGroup" class="btn btn-success" Text="Update Stage" runat="server" OnClick="btnAddClasses_Click" ValidationGroup="q1" />
                        </div>

                        <hr />
                        <p style="text-align: center">
                            <asp:Label ID="lblMsg" runat="server" ForeColor="green" Font-Bold="true" Text="" Font-Size="Larger"></asp:Label>
                            <p style="padding-top: 20px; text-align: center">
                                <asp:Button ID="btnTLead" runat="server" Text="Assign & View Team Leads" CssClass="btn btn-success" OnClick="btnAssign_Click" />
                                <asp:Button ID="btnClient" runat="server" Text="Generate Client Credentials" CssClass="btn btn-primary" OnClick="btnClient_Click" />
                            </p>
                        </p>
                        <hr />
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

                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

