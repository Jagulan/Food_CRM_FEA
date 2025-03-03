<%@ Page Title="Company :: FEA" Language="C#" MasterPageFile="~/Account/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Company.aspx.cs" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">
        <div class="main-page signup-page">
            <h3 class="title1">Delete Company
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
                                            <th>Company Name<br />
                                                &nbsp;</th>
                                            <th>Phone<br />
                                                &nbsp;</th>
                                            <th>Email<br />
                                                &nbsp;</th>
                                            <th>Address<br />
                                                &nbsp;</th>
                                            <th>Description<br />
                                                &nbsp;</th>
                                            <th>Contacts<br />
                                                &nbsp;</th>
                                            <th>Delete<br />
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
                                                                    <asp:Label ID="lblTeamLead" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("DateCreated") %>' /></b>
                                                                </th>
                                                                <th scope="row">
                                                                    <asp:Label ID="lblName" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Name") %>' /></b>
                                                                </th>
                                                                <th scope="row">
                                                                    <asp:Label ID="lblPhone" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("OfficialContactNumber") %>' /></b>
                                                                </th>
                                                                <th scope="row">
                                                                    <asp:Label ID="lblEmail" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("OfficialContactEmail") %>' /></b>
                                                                </th>
                                                                <th scope="row">
                                                                    <asp:Label ID="lblAddress" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Address") %>' /></b>
                                                                </th>
                                                                <th scope="row">
                                                                    <asp:Label ID="lblDescription" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Description") %>' /></b>
                                                                </th>

                                                                <th scope="row" style="text-align: center">
                                                                    <a href="Contacts.aspx?CompanyId=<%# Eval("Id")%>">
                                                                        <img src="../../images/contacts.png" height="25px"/>
                                                                    </a>
                                                                </th>

                                                               
                                                                <th scope="row" style="text-align: center">
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

