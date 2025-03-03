<%@ Page Title="Milestone Template :: FEA" Language="C#" MasterPageFile="~/Account/Project-Team/MasterPage.master" AutoEventWireup="true" CodeFile="MilestoneTemplate.aspx.cs" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">
        <div class="main-page signup-page">
            <h3 class="title1">
                <asp:Label Text="" runat="server" ID="lblCompanyName"></asp:Label></h3>
            <asp:Label ID="lblGMsg" runat="server" ForeColor="red"></asp:Label>

            <div class="sign-up-row widget-shadow">

                <div class="form-body" data-example-id="simple-form-inline">

                    <asp:Repeater ID="r1" runat="server">
                        <ItemTemplate>

                            <div class="col-md-6">
                                <br />
                                <h2>Create Milestone Template</h2>

                            </div>

                            <div class="col-md-6" style="text-align: right">
                                <br />
                                <%--<a href="Ticket.aspx?ProjectId=<%# Eval("Id")%>" class="btn btn-default" />Tickets</a>--%>
                                <a href="MilestoneTemplate.aspx?ProjectId=<%# Eval("Id")%>" class="btn btn-success" />Create Milestone Template </a>

                                &nbsp;|&nbsp;
                                <a href="ViewProject.aspx?ProjectId=<%# Eval("Id")%>" class="btn btn-primary" />Project Details</a>
                                >
                            <a href="Milestones.aspx?ProjectId=<%# Eval("Id")%>" class="btn btn-danger">Milestones</a>
                                >
                            <a href="Tasks.aspx?ProjectId=<%# Eval("Id")%>" class="btn btn-success">Tasks</a>


                            </div>
                            <div class="clearfix"></div>

                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="clearfix"></div>
                    <br />
                    <br />

                    <div class="form-inline">
                        <hr />
                        <div class="form-group">
                            <h3>Step 1: Create Milestone Package</h3>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPackageName" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="q1"></asp:RequiredFieldValidator>
                            <input type="text" runat="server" class="form-control" id="txtPackageName" placeholder="Package Name" />

                            <asp:Button ID="btnGroupTemplateName" class="btn btn-default" Text="Save" runat="server" OnClick="btnGroupMilestonePackage_Click" ValidationGroup="q1" />
                            <asp:Label ID="lblMsgTemplateName" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>
                            <br />
                            <br />
                            <table class="table table-hover">
                                <thead>
                                    <tr>

                                        <th>Package Name</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="r5" runat="server" OnItemCommand="r5_ItemCommand">
                                        <ItemTemplate>
                                            <div class="col-md-12 switch-rightt">
                                                <div class="switch-right-grid">
                                                    <div class="switch-right-grid1">
                                                        <tr>

                                                            <th scope="row">

                                                                <asp:Label ID="lblTeamLead" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("PackageName") %>' /></b>
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
                    <br />
                    <br />


                    <div class="form-inline">
                        <h3>Step 2: Create Milestones in the Package</h3>
                        <br />
                        <div class="form-group">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlMilestone" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="q2"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="ddlMilestone" runat="server" AutoPostBack="True" class="form-control" Font-Size="Large">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="q2"></asp:RequiredFieldValidator>
                            <input type="text" runat="server" class="form-control" id="txtName" placeholder="Milestone Name" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDesc" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="q2"></asp:RequiredFieldValidator>
                            <input type="text" runat="server" class="form-control" id="txtDesc" placeholder="Short Description" />

                            <asp:Button ID="btnGroup" class="btn btn-default" Text="Save" runat="server" OnClick="btnGroup_Click" ValidationGroup="q2" />
                            <asp:Label ID="lblMsg" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="form-inline">
                        <h3>Step 3: View Milestone Package</h3>
                        <br />
                        <div class="form-group">
                            <asp:DropDownList ID="ddlShowMilestone" runat="server" AutoPostBack="True" class="form-control" Font-Size="Large" OnTextChanged="ddlShowMilestone_TextChanged">
                            </asp:DropDownList>
                            <br />
                            <br />
                            <table class="table table-hover">
                                <thead>
                                    <tr>

                                        <th>Milestone Name</th>
                                        <th>Description</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="r3" runat="server" OnItemCommand="Order_ItemCommand">
                                        <ItemTemplate>
                                            <div class="col-md-12 switch-rightt">
                                                <div class="switch-right-grid">
                                                    <div class="switch-right-grid1">
                                                        <tr>

                                                            <th scope="row">

                                                                <asp:Label ID="lblTeamLead" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Name") %>' /></b>
                                                            </th>

                                                            <th scope="row">

                                                                <asp:Label ID="Label2" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Description") %>' /></b>
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
</asp:Content>

