<%@ Page Title="Project :: FEA" Language="C#" MasterPageFile="~/Account/Sales/MasterPage.master" AutoEventWireup="true" CodeFile="Project.aspx.cs" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">
        <div class="main-page signup-page">
            <h3 class="title1">Add a new project
            </h3>
            <asp:Label ID="lblGMsg" runat="server" ForeColor="red"></asp:Label>

            <div class="sign-up-row widget-shadow">

                <div class="form-body" data-example-id="simple-form-inline">
                    <div class="form-inline">

                        <div class="form-group">
                            <asp:HiddenField runat="server" ID="hdBalance" />

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="*" ValidationGroup="q1" ForeColor="red" Font-Bold="true"></asp:RequiredFieldValidator>
                            <input type="text" runat="server" class="form-control" id="txtName" placeholder="Project Name" />
                            <br />
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDesc" Display="Dynamic" ErrorMessage="*" ValidationGroup="q1" ForeColor="red" Font-Bold="true"></asp:RequiredFieldValidator>
                            <textarea runat="server" class="form-control" id="txtDesc" placeholder="Short Description"></textarea>
                            <br />
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlCompany" Display="Dynamic" ErrorMessage="*" ValidationGroup="q1" ForeColor="red" Font-Bold="true"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="ddlCompany" runat="server" AutoPostBack="True" class="form-control" Font-Size="Large">
                            </asp:DropDownList>
                        </div>

                        <hr />
                        <asp:Button ID="btnGroup" class="btn btn-default" Text="Save" runat="server" OnClick="btnAddClasses_Click" ValidationGroup="q1" />
                        <asp:Label ID="lblMsg" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>


                        <div class="bs-example widget-shadow" data-example-id="hoverable-table">

                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Date Created
                                        <br />
                                            <r style="font-size: smaller; color: grey">(mm/dd/yyyy)</r>
                                        </th>
                                        <th>Project Name<br />
                                            &nbsp;</th>
                                        <th>Company Name<br />
                                            &nbsp;</th>
                                        <th>Description<br />
                                            &nbsp;</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Order" runat="server">
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
                                                                <asp:Label ID="Label2" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("CompanyName") %>' /></b>
                                                            </th>
                                                            <th scope="row">
                                                                <asp:Label ID="Label1" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Description") %>' /></b>
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
</asp:Content>

