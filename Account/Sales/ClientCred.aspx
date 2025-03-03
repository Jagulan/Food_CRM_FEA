<%@ Page Title="Client Credentials :: FEA" Language="C#" MasterPageFile="~/Account/Sales/MasterPage.master" AutoEventWireup="true" CodeFile="ClientCred.aspx.cs" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">
        <div class="main-page signup-page">
            <h3 class="title1">Generate Client Credentials
            </h3>
            <asp:Label ID="lblGMsg" runat="server" ForeColor="red"></asp:Label>

            <div class="sign-up-row widget-shadow">

                <div class="form-body" data-example-id="simple-form-inline">
                    <div class="form-inline">

                        <div class="form-group">
                            <asp:HiddenField runat="server" ID="hdBalance" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlTeamLead" Display="Dynamic" ErrorMessage="*" ValidationGroup="q1" ForeColor="red" Font-Bold="true"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="ddlTeamLead" runat="server" AutoPostBack="True" class="form-control" Font-Size="Large">
                            </asp:DropDownList>
                        </div>

                        <hr />
                        <asp:Button ID="btnGroup" class="btn btn-default" Text="Save" runat="server" OnClick="btnAddClasses_Click" ValidationGroup="q1" />
                        <asp:Label ID="lblMsg" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>


                        <div class="bs-example widget-shadow" data-example-id="hoverable-table">

                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Email</th>
                                        <th>Name</th>
                                        <th>Password</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Order" runat="server" OnItemCommand="Order_ItemCommand">
                                        <itemtemplate>
                                            <div class="col-md-12 switch-rightt">
                                                <div class="switch-right-grid">
                                                    <div class="switch-right-grid1">
                                                        <tr>

                                                            <th scope="row">
                                                                <asp:Label ID="lblName" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Email") %>' />
                                                                </b>
                                                            </th>
                                                            <th scope="row">
                                                                <asp:Label ID="Label2" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Name") %>' />
                                                                </b>
                                                            </th>
                                                            <th scope="row">
                                                                <asp:Label ID="lblTeamLead" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Password") %>' />
                                                                </b>
                                                            </th>

                                                            <th scope="row">
                                                                <asp:ImageButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("Email") %>' CommandName="delete" ImageUrl="~/images/delete.jpg" OnClientClick="return confirm('Are you sure you want to delete?')" />
                                                            </th>
                                                        </tr>
                                                    </div>
                                                </div>

                                            </div>
                                        </itemtemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

