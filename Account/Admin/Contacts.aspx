<%@ Page Title="Contacts :: FEA" Language="C#" MasterPageFile="~/Account/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Contacts.aspx.cs" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">
        <div class="main-page signup-page">
            <h3 class="title1">Delete Contacts
            </h3>
            <asp:Label ID="lblGMsg" runat="server" ForeColor="red"></asp:Label>
            <div class="sign-up-row widget-shadow">
                <div class="form-body">
                    <div class="form-inline">

                        <div class="form-group">

                            <div class="bs-example widget-shadow" data-example-id="hoverable-table">

                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Date Created
                                                <br />
                                                <r style="font-size: smaller; color: grey">(mm/dd/yyyy)</r>
                                            </th>
                                            <th>Name<br />
                                                &nbsp;</th>
                                            <th>Position<br />
                                                &nbsp;</th>
                                            <th>Company<br />
                                                &nbsp;</th>
                                            <th>Mobile<br />
                                                &nbsp;</th>
                                            <th>Email<br />
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
                                                                    <asp:Label ID="lblTeamLead" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Date") %>' /></b>
                                                                </th>
                                                                <th scope="row">
                                                                    <asp:Label ID="lblName" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Name") %>' /></b>
                                                                </th>
                                                               
                                                                <th scope="row">
                                                                    <asp:Label ID="lblPosition" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Position") %>' /></b>
                                                                </th>
                                                                <th scope="row">
                                                                    <asp:Label ID="lblCompany" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("CompanyName") %>' /></b>
                                                                </th>
                                                                <th scope="row">
                                                                    <asp:Label ID="lblMobile" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Mobile") %>' /></b>
                                                                </th>
                                                                <th scope="row">
                                                                    <asp:Label ID="lblEmail" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Email") %>' /></b>
                                                                </th>
                                                                <th scope="row">
                                                                    <asp:ImageButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="delete" ImageUrl="~/images/delete.jpg" OnClientClick="return confirm('Are you sure you want to delete?')" />
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
        </div>
    </div>
</asp:Content>

