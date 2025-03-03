<%@ Page Title="Raise Ticket :: FEA" Language="C#" MasterPageFile="~/Account/Project-Team/MasterPage.master" AutoEventWireup="true" CodeFile="RaiseTicket.aspx.cs" Inherits="Purchase" %>

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
                            <div class="col-md-7">
                                <h2>Raise Ticket</h2>
                            </div>
                            <div class="col-md-5" style="text-align: right">
                                <a href="ViewProject.aspx?ProjectId=<%# Eval("Id")%>" class="btn btn-primary" />Project Details</a>
                                >
                                <a href="Ticket.aspx?ProjectId=<%# Eval("Id")%>" class="btn btn-success" />Tickets</a>
                             

                            </div>
                            <div class="clearfix"></div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="clearfix"></div>
                    <div class="form-inline">
                        <hr />
                        <div class="form-group">
                            <input type="text" runat="server" class="form-control" id="txtName" placeholder="Ticket Name / Subject" required="" />
                            <input type="text" runat="server" class="form-control" id="txtDesc" placeholder="Short Description" required="" />
                            <asp:DropDownList runat="server" ID="ddlPriority" class="form-control" Font-Size="Large">
                                <asp:ListItem Text="--Select Priority--" Value=""></asp:ListItem>
                                <asp:ListItem Text="High" Value="High"></asp:ListItem>
                                <asp:ListItem Text="Mid" Value="Mid"></asp:ListItem>
                                <asp:ListItem Text="Low" Value="Low"></asp:ListItem>
                            </asp:DropDownList>

                            <asp:Button ID="btnGroup" class="btn btn-default" Text="Save" runat="server" OnClick="btnGroup_Click" ValidationGroup="q1" />
                            <asp:Label ID="lblMsg" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

