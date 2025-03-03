<%@ Page Title="Dashboard :: FEA" Language="C#" MasterPageFile="~/Account/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">
        <div class="main-page signup-page">
            <h3 class="title1">Projects In Sales Cycle</h3>
            <asp:Label ID="lblGMsg" runat="server" ForeColor="red"></asp:Label>
            <div class="sign-up-row widget-shadow">
                <div class="form-body" data-example-id="simple-form-inline">
                    <div class="row-one">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Project Name<br />
                                        &nbsp;
                                    </th>
                                    <th>Company Name<br />
                                        &nbsp;</th>
                                    <th>Current Stage<br />
                                        &nbsp;</th>
                                    <th>Date Created
                                    <br />
                                        <r style="font-size: smaller; color: grey">(mm/dd/yyyy)</r>
                                    </th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="r1" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-12 switch-rightt">
                                            <div class="switch-right-grid">
                                                <div class="switch-right-grid1">
                                                    <tr>
                                                        <th scope="row">
                                                            <a href="ViewProjectSalesCycle.aspx?ProjectId=<%# Eval("Id")%>">
                                                                <asp:Label ID="lblName" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("Name") %>' /></b></a>
                                                        </th>
                                                        <th scope="row">
                                                            <a href="ViewProjectSalesCycle.aspx?ProjectId=<%# Eval("Id")%>">
                                                            <asp:Label ID="lblTeamLead" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("CompanyName") %>' /></b></a>
                                                        </th>
                                                        <th scope="row">
                                                            <a href="ViewProjectSalesCycle.aspx?ProjectId=<%# Eval("Id")%>">
                                                            <asp:Label ID="Label1" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("CurrentStage") %>' /></b></a>
                                                        </th>
                                                        <th scope="row">
                                                            <a href="ViewProjectSalesCycle.aspx?ProjectId=<%# Eval("Id")%>">
                                                            <asp:Label ID="Label2" Style="font-size: x-large" runat="server" ForeColor="#DAB66F" Text='<%# Eval("DateCreated") %>' /></b></a>
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
            <div class="clearfix"></div>
        </div>
    </div>
</asp:Content>

