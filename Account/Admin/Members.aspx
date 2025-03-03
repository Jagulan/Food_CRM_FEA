<%@ Page Title="Members :: FEA" Language="C#" MasterPageFile="~/Account/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Members.aspx.cs" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">
        <div class="main-page signup-page">
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <asp:UpdatePanel ID="pnlPageRefresh" runat="server">
                <ContentTemplate>
                    <h3 class="title1">Account Management</h3>
                    <asp:Label ID="lblGMsg" runat="server" ForeColor="red"></asp:Label>

                    <div class="sign-up-row widget-shadow">

                        <div class="form-body" data-example-id="simple-form-inline">
                            <div class="form-inline">

                                <div class="form-group">

                                    <asp:HiddenField runat="server" ID="hdBalance" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="*" ValidationGroup="q1" ForeColor="red" Font-Bold="true"></asp:RequiredFieldValidator>
                                    <input type="text" runat="server" class="form-control" id="txtName" placeholder="Name" />

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="*" ValidationGroup="q1" ForeColor="red" Font-Bold="true"></asp:RequiredFieldValidator>
                                    <input type="text" runat="server" class="form-control" id="txtEmail" placeholder="Email" />

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="*" ValidationGroup="q1" ForeColor="red" Font-Bold="true"></asp:RequiredFieldValidator>
                                    <input type="text" runat="server" class="form-control" id="txtPassword" placeholder="Password" />

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlType" Display="Dynamic" ErrorMessage="*" ValidationGroup="q1" ForeColor="red" Font-Bold="true"></asp:RequiredFieldValidator>
                                    <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" class="form-control" Font-Size="Large">
                                        <asp:ListItem Text="--Select Type--" Value=""></asp:ListItem>
                                        <asp:ListItem Text="Sales" Value="Sales"></asp:ListItem>
                                        <asp:ListItem Text="Project-Team" Value="Project-Team"></asp:ListItem>
                                        <asp:ListItem Text="Client" Value="Client"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <br />
                                <hr />
                                <asp:Button ID="btnGroup" class="btn btn-default" Text="Save" runat="server" OnClick="btnAddMembers_Click" ValidationGroup="q1" />
                                <asp:Label ID="lblMsg" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>
                            </div>
                        </div>
                        <div class="form-body">
                            <div class="form-inline">

                                <div class="form-group">

                                    <div class="bs-example widget-shadow" data-example-id="hoverable-table">

                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Type</th>
                                                    <th>Password</th>
                                                    <th>Delete</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <asp:Repeater ID="Members" runat="server" OnItemCommand="Members_ItemCommand">
                                                    <ItemTemplate>
                                                        <div class="col-md-12 switch-rightt">
                                                            <div class="switch-right-grid">
                                                                <div class="switch-right-grid1">
                                                                    <tr>
                                                                        <th scope="row">
                                                                            <asp:Label ID="lblTeamLead" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Name") %>' /></b>
                                                                        </th>
                                                                        <th scope="row">
                                                                            <asp:Label ID="lblName" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Email") %>' /></b>
                                                                        </th>
                                                                        <th scope="row">
                                                                            <asp:Label ID="lblType" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Type") %>' /></b>
                                                                        </th>
                                                                        <th scope="row">
                                                                            <asp:Label ID="lblPassword" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Password") %>' /></b>
                                                                        </th>
                                                                        <th scope="row">
                                                                            <asp:ImageButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("Email") %>' CommandName="delete" ImageUrl="~/images/delete.jpg" OnClientClick="return confirm('Are you sure you want to delete?')" />
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
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>

