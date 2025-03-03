<%@ Page Title="Tasks :: FEA" Language="C#" MasterPageFile="~/Account/Client/MasterPage.master" AutoEventWireup="true" CodeFile="Tasks.aspx.cs" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="pnlPageRefresh" runat="server">
        <ContentTemplate>
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
                                        <h2>Tasks</h2>

                                    </div>

                                    <div class="col-md-6" style="text-align: right">
                                        <br />
                                        <a href="MilestoneTemplate.aspx?ProjectId=<%# Eval("Id")%>" class="btn btn-success" />Create Milestone Template </a>

                                        <%--                                        <a href="Ticket.aspx?ProjectId=<%# Eval("Id")%>" class="btn btn-default" />Tickets</a>--%>
                                
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

                                    <asp:DropDownList ID="ddlMilestone" runat="server" AutoPostBack="True" class="form-control" Font-Size="Large">
                                    </asp:DropDownList>
                                    <input type="text" runat="server" class="form-control" id="txtName" placeholder="Task Name" required="" />
                                    <input type="text" runat="server" class="form-control" id="txtDesc" placeholder="Short Description" required="" />
                                    <asp:DropDownList ID="ddlMember" runat="server" AutoPostBack="True" class="form-control" Font-Size="Large"></asp:DropDownList>

                                    <br />
                                    <br />
                                    <h2>Deadline</h2>
                                    <br />
                                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" Style="background: transparent; font-weight: bolder" Placeholder="Deadline" TextMode="Date"></asp:TextBox>
                                    <asp:TextBox ID="txtTime" runat="server" CssClass="form-control" Style="background: transparent; font-weight: bolder" Placeholder="Deadline" TextMode="Time"></asp:TextBox>
                                    <br />
                                    <br />

                                    <asp:Button ID="btnGroup" class="btn btn-default" Text="Save" runat="server" OnClick="btnGroup_Click" ValidationGroup="q1" />

                                    <asp:Label ID="lblMsg" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

