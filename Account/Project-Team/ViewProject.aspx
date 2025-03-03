<%@ Page Title="View Project :: FEA" Language="C#" MasterPageFile="~/Account/Project-Team/MasterPage.master" AutoEventWireup="true" CodeFile="ViewProject.aspx.cs" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 80px;
            color: #FF0000;
        }

        .auto-style4 {
            width: 20px;
            color: #FF0000;
        }

        .auto-style2 {
            color: #33848c;
            font-weight: bolder;
            font-size: large;
        }

        .auto-style3 {
            color: #808080;
            font-size: large;
            padding-left: 30px;
        }

        .order-link {
            display: block;
            border-radius: 20px;
            padding: 10px;
            transition: background-color 0.3s ease;
        }

            .order-link:hover {
                background-color: #69696932; /* Change this to the desired background color on hover */
            }

        .auto-style8 {
            padding: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">
        <div class="main-page signup-page">
            <h3 class="title1">Projects Details
            </h3>
            <asp:Label ID="lblGMsg" runat="server" ForeColor="red"></asp:Label>

            <div class="sign-up-row widget-shadow">

                <div class="form-body" data-example-id="simple-form-inline">
                    <asp:Repeater ID="r1" runat="server" OnItemDataBound="r1_ItemDataBound">
                        <ItemTemplate>
                            <div class="col-md-9">
                                <p style="font-size: 40px; color: #000000">Project: <%# Eval("Name") %></p>
                                <p style="color: #808080; font-size: 20px">Company: <%# Eval("CompanyName") %></p>
                            </div>

                            <div class="col-md-3" style="text-align: right">

                                <br />
                                <a href="Ticket.aspx?ProjectId=<%# Eval("Id")%>" class="btn btn-default" />Tickets</a>
   
                                <asp:Panel runat="server" ID="adminoptions" CssClass="btn-group">
                                    <span class="btn btn-danger">
                                        <a href="Milestones.aspx?ProjectId=<%# Eval("Id")%>" style="color: white;">Milestones</a>
                                    </span>
                                    <span class="btn btn-success">
                                        <a href="Tasks.aspx?ProjectId=<%# Eval("Id")%>" style="color: white;">Tasks</a>
                                    </span>
                                </asp:Panel>

                            </div>


                        </ItemTemplate>
                    </asp:Repeater>
                    <br />
                    <br />
                    <div class="col-md-12">
                        <br />
                        <h2>Milestones & Tasks</h2>
                        <br />
                        <asp:Repeater ID="Order" runat="server" OnItemDataBound="Order_ItemDataBound">
                            <ItemTemplate>
                                <table class="nav-justified">
                                    <tr>
                                        <td>
                                            <span class="fa fa-folder-open" style="padding-right: 10px"></span>
                                            <asp:HiddenField ID="hfThreadId" runat="server" Value='<%# Eval("Id") %>' />
                                            <a>
                                                <asp:Label ID="lblAnn" runat="server" Text='<%# Eval("Name") %>' CssClass="auto-style2" />
                                                | Milestone Last Deadline: 
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("LastDate") %>' CssClass="auto-style2" />
                                            </a>
                                            <br />
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Description") %>' CssClass="auto-style3" />
                                            <br />

                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table class="nav-justified">
                                    <tr>
                                        <td class="auto-style4"></td>
                                        <td>
                                            <asp:Repeater ID="rptOrders" runat="server">
                                                <ItemTemplate>
                                                    <table class="nav-justified">
                                                        <tr>
                                                            <td>
                                                                <a href="TaskDetails.aspx?TaskId=<%# Eval("Id")%>" class="order-link">
                                                                    <span class="fa fa-file-o" style="padding-right: 10px"></span>

                                                                    <asp:HiddenField ID="hfThreadId" runat="server" Value='<%# Eval("Id") %>' />
                                                                    <asp:HiddenField ID="hfThreadId1" runat="server" Value='<%# Eval("ProjectId") %>' />
                                                                    <asp:Label ID="lblAnn" runat="server" Text='<%# Eval("Name") %>' CssClass="auto-style2" />
                                                                    <br />
                                                                    <span class="auto-style8">Status:
                                                                       <asp:Label ID="Label6" runat="server" Text='<%# Eval("Status") %>' CssClass="auto-style2" />
                                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("CloseDate") %>' CssClass="auto-style2" />
                                                                        &nbsp;|&nbsp;Deadline:

                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Deadline") %>' CssClass="auto-style2" />
                                                                        &nbsp;|&nbsp;Assigned To: 
                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("AssignedTo") %>' CssClass="auto-style2" />
                                                                    </span>
                                                                    <br />
                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Description") %>' CssClass="auto-style3" />
                                                                </a>
                                                            </td>

                                                        </tr>
                                                    </table>
                                                    <br />
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <FooterTemplate>
                                <div id="dvNoRecords" runat="server" visible="false" style="padding: 20px 20px; text-align: center; color: Red;">
                                    <img src="../../images/DiscussionForum.png" />
                                </div>
                            </FooterTemplate>
                        </asp:Repeater>
                        <br />
                        <br />
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <h2>Members</h2>
                            <br />
                        </div>
                        <div class="col-md-6">
                            <asp:Panel runat="server" ID="addmember">

                                <p style="text-align: right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlMember" Display="Dynamic" ErrorMessage="*" ValidationGroup="q1" ForeColor="red" Font-Bold="true"></asp:RequiredFieldValidator>
                                    <asp:DropDownList ID="ddlMember" runat="server" AutoPostBack="True" class="form-control" Font-Size="Large">
                                    </asp:DropDownList>
                                    <asp:Button ID="btnGroup" class="btn btn-success" Text="Add Member" runat="server" OnClick="btnAddClasses_Click" ValidationGroup="q1" />
                                    <asp:Label ID="lblMsg" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>
                                    <br />
                                    <br />
                                </p>
                            </asp:Panel>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-12">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Type</th>
                                    <th>Email</th>
                                    <th>Name</th>
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
                                                            <asp:Label ID="Label1" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='Team Leader' /></b>
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
                    <div class="clearfix"></div>
                </div>
            </div>

        </div>
    </div>
    </div>
</asp:Content>

