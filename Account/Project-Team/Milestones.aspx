<%@ Page Title="Milestones :: FEA" Language="C#" MasterPageFile="~/Account/Project-Team/MasterPage.master" AutoEventWireup="true" CodeFile="Milestones.aspx.cs" Inherits="Purchase" %>

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
            <h3 class="title1">
                <asp:Label Text="" runat="server" ID="lblCompanyName"></asp:Label></h3>
            <asp:Label ID="lblGMsg" runat="server" ForeColor="red"></asp:Label>

            <div class="sign-up-row widget-shadow">

                <div class="form-body" data-example-id="simple-form-inline">
                    <asp:Repeater ID="r1" runat="server">
                        <ItemTemplate>

                            <div class="col-md-6">
                                <br />
                                <h2>Milestones</h2>

                            </div>

                            <div class="col-md-6" style="text-align: right">
                                <br />
                                <a href="MilestoneTemplate.aspx?ProjectId=<%# Eval("Id")%>" class="btn btn-success" />Create Milestone Template </a>

                                <%--                                <a href="Ticket.aspx?ProjectId=<%# Eval("Id")%>" class="btn btn-default" />Tickets</a>--%>
                                
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
                    <div class="form-inline">


                        <hr />
                        <div class="form-group">

                            <h3>Add Milestone Individually</h3>
                            <br />

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="q2"></asp:RequiredFieldValidator>
                            <input type="text" runat="server" class="form-control" id="txtName" placeholder="Milestone Name" />



                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDesc" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="q2"></asp:RequiredFieldValidator>
                            <input type="text" runat="server" class="form-control" id="txtDesc" placeholder="Short Description" />


                            <hr />
                            <asp:Button ID="btnGroup" class="btn btn-success" Text="Save" runat="server" OnClick="btnGroup_Click" ValidationGroup="q2" />

                            <asp:Label ID="lblMsg" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>
                        </div>
                        <br />
                        <br />

                        <div class="form-inline">
                            <h3>Add Milestone Template</h3>
                            <br />
                            <div class="form-group">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlShowMilestone" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="q1"></asp:RequiredFieldValidator>

                                <asp:DropDownList ID="ddlShowMilestone" runat="server" AutoPostBack="True" class="form-control" Font-Size="Large" OnTextChanged="ddlShowMilestone_TextChanged">
                                </asp:DropDownList>
                                <br />
                                <br />
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Milestone Name</th>
                                            <th>Description</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="r3" runat="server">
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
                                                            </tr>
                                                        </div>
                                                    </div>

                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                                <asp:Button ID="AddPackage" class="btn btn-success" Text="Add this package" runat="server" OnClick="AddPackage_Click" ValidationGroup="q1" />
                                <asp:Label ID="lblMsgPackage" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-12">
                        <br />
                        <br />
                        <h2>Milestones & Tasks</h2>
                        <br />
                        <asp:Repeater ID="Order" runat="server" OnItemDataBound="Order_ItemDataBound" OnItemCommand="Orders_ItemCommand">
                            <ItemTemplate>
                                <table class="nav-justified">
                                    <tr>
                                        <td>
                                            <div class="col-md-11">
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
                                            </div>
                                            <div class="col-md-1"></div>
                                            <asp:ImageButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="delete" ImageUrl="~/images/delete.jpg" OnClientClick="return confirm('Are you sure you want to delete?')" />

                                            </div>
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
                                                                <div class="col-md-11">

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
                                                                </div>





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
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

