<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="Eshopper_Project.ProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/Profile.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="row">
            <div class="col-sm-6 col-xs-12">
                <div class="form-group">
                    <label for="InputUserName">Username*</label>
                    <asp:TextBox ID="txtUsername" class="form-control" placeholder="Please enter your username" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ValidationGroup="submit" ErrorMessage="Username field must be fill out." ControlToValidate="txtUsername" Style="color: red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-sm-6 col-xs-12">
                <label for="InputGender">Gender*</label><br />
                <asp:RadioButton Text="male" ID="male" Value="M" runat="server" class="gender radio-inline" GroupName="gender"></asp:RadioButton>
                <asp:RadioButton Text="female" ID="female" Value="F" runat="server" class="gender radio-inline" GroupName="gender"></asp:RadioButton>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-xs-12">
                <div class="form-group">
                    <label for="InputPassword">Password*</label>
                    <asp:TextBox TextMode="Password" ID="txtPassword" class="form-control red-tooltip" placeholder="Please enter 8 character long Password with capital & special character & number" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ValidationGroup="submit" ErrorMessage="Password field must be fill out." ControlToValidate="txtPassword" Style="color: red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-sm-6 col-xs-12">
                <div class="form-group">
                    <label for="InputEmail">Email*</label>
                    <asp:TextBox TextMode="Email" ID="txtEmail" class="form-control" aria-describedby="emailHelp" placeholder="Please enter valid Email" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ValidationGroup="submit" ErrorMessage="Email field must be fill out." ControlToValidate="txtEmail" Style="color: red"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-xs-12">
                <div class="form-group">
                    <label for="InputFirstName">First name*</label>
                    <asp:TextBox ID="txtFirstname" class="form-control" name="FirstName" placeholder="Please enter your first name" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ValidationGroup="submit" ErrorMessage="First Name field must be fill out." ControlToValidate="txtFirstname" Style="color: red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-sm-6 col-xs-12">
                <div class="form-group">
                    <label for="InputPhone">mobile*</label>
                    <asp:TextBox TextMode="Phone" ID="txtMobile" class="form-control" name="Mobile" placeholder="Please enter your phone number" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMobile" runat="server" ValidationGroup="submit" ErrorMessage="Mobile field must be fill out." ControlToValidate="txtMobile" Style="color: red"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-xs-12">
                <div class="form-group">
                    <label for="InputLastName">Last name</label>
                    <asp:TextBox ID="txtLastname" class="form-control" name="LastName" placeholder="Please enter your Last name" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" ValidationGroup="submit" ErrorMessage="Last Name field must be fill out." ControlToValidate="txtLastname" Style="color: red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-sm-6 col-xs-12">
                <div class="form-group">
                    <label for="InputPhone">Phone*</label>
                    <asp:TextBox ID="txtPhone" TextMode="Phone" class="form-control" name="phone" placeholder="Please enter your phone number EX.(123)-456-7890" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" ValidationGroup="submit" ErrorMessage="Phone field must be fill out." ControlToValidate="txtPhone" Style="color: red"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-xs-12">
            </div>
            <div class="col-sm-6 col-xs-12">
                <label>Date of Birth</label>
                <div class="input-group date">
                    <asp:TextBox ID="datepicker" class="form-control" name="BirthDate" placeholder="Date of Birth" runat="server" />
                    <span class="input-group-addon">
                        <img src="images/date.png" />
                    </span>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorBirthDate" runat="server" ValidationGroup="submit" ErrorMessage="Birth Date field must be fill out." ControlToValidate="datepicker" Style="color: red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6 col-xs-12" id="billing_info">
                <h2 style="font-size: 20px; display: inline-block;">Billing Address*</h2>
                <div class="form-group">
                    <label for="InputStreet">Street</label>
                    <asp:TextBox ID="txtbstreet" class="form-control billing" name="BillingStreet" placeholder="Please enter your street" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBstreet" runat="server" ValidationGroup="submit" ErrorMessage="Street field must be fill out." ControlToValidate="txtbstreet" Style="color: red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="InputCity">city</label>
                    <asp:TextBox ID="txtbcity" class="form-control billing" name="BillingCity" placeholder="Please enter your city" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBcity" runat="server" ValidationGroup="submit" ErrorMessage="City field must be fill out." ControlToValidate="txtbcity" Style="color: red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label for="state">state</label>
                    <asp:DropDownList ID="txtbstate" class="form-control shipping dropdown" name="ShippingState" runat="server">
                        <asp:ListItem Value="">--select one--</asp:ListItem>
                        <asp:ListItem Value="1">Gujrat</asp:ListItem>
                        <asp:ListItem Value="2">3</asp:ListItem>
                        <asp:ListItem Value="3">4</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="Contry">contry</label>
                    <asp:DropDownList ID="txtbcontry" class="form-control shipping dropdown" name="ShippingContry" runat="server">
                        <asp:ListItem Value="">--select one--</asp:ListItem>
                        <asp:ListItem Value="1">India</asp:ListItem>
                        <asp:ListItem Value="2">3</asp:ListItem>
                        <asp:ListItem Value="3">4</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-sm-6 col-xs-12">
                <div class="row">
                    <div class="col-xs-12">
                        <h2 class="inline_block font_20">Shipping Address*</h2>
                        <div class="checkbox inline_block" id="chksame" style="margin-top: 20px;">
                            <label style="font-size: 13px;">
                                <input type="checkbox" id="chkbill" value="" />same as Billing Address</label>
                        </div>
                    </div>
                </div>
                <div id="shopping_info">
                    <div class="form-group">
                        <label for="InputStreet">Street</label>
                        <asp:TextBox ID="txtsstreet" class="form-control shipping" name="ShippingStreet" placeholder="Please enter your street" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorSstreet" runat="server" ValidationGroup="submit" ErrorMessage="Street field must be fill out." ControlToValidate="txtsstreet" Style="color: red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="InputCity">city</label>
                        <asp:TextBox ID="txtscity" class="form-control shipping" name="ShippingCity" placeholder="Please enter your city" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorScity" runat="server" ValidationGroup="submit" ErrorMessage="City field must be fill out." ControlToValidate="txtscity" Style="color: red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="state">state</label>
                        <asp:DropDownList ID="txtsstate" class="form-control shipping dropdown" name="ShippingState" runat="server">
                            <asp:ListItem Value="">--select one--</asp:ListItem>
                            <asp:ListItem Value="1">Gujrat</asp:ListItem>
                            <asp:ListItem Value="2">3</asp:ListItem>
                            <asp:ListItem Value="3">4</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="Contry">contry</label>
                        <asp:DropDownList ID="txtscontry" class="form-control shipping dropdown" name="ShippingContry" runat="server">
                            <asp:ListItem Value="">--select one--</asp:ListItem>
                            <asp:ListItem Value="1">India</asp:ListItem>
                            <asp:ListItem Value="2">3</asp:ListItem>
                            <asp:ListItem Value="3">4</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>

        <div class="row" style="margin-right: 4px !important">
            <div class="col-sm-6 col-xs-12">
                <div class="checkbox">
                    <label style="font-size: 13px;">
                        <input type="checkbox" id="chkterms" name="chkterms" />I Agree with Terms & Conditions</label>
                </div>
            </div>
            <div class="col-sm-6 col-xs-12 text-right submit">
                <asp:Button runat="server" class="btn btn-primary" ID="submit" ValidationGroup="submit" Text="Submit" OnClick="submit_Click"/>
            </div>
        </div>

    </div>

</asp:Content>
