<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Eshopper_Project.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Contacts page</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-xs-12">

                <div class="row">
                    <div class="col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label for="InputName" id="lblName">Name</label>
                            <asp:TextBox ID="txtName" class="form-control" placeholder="Please enter your name" autofocus="true" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ValidationGroup="submit" ErrorMessage="Name field must be fill out." ControlToValidate="txtName" Style="color: red"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="InputEmail" id="lblEmail">Email</label>
                            <asp:TextBox TextMode="Email" ID="txtEmail" class="form-control" placeholder="Please enter valid email" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ValidationGroup="submit" ErrorMessage="Email field must be fill out." ControlToValidate="txtEmail" Style="color: red"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="InputSubject" id="lblSubject">Subject</label>
                            <asp:TextBox ID="txtSubject" class="form-control" placeholder="Please enter subject" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSubject" runat="server" ValidationGroup="submit" ErrorMessage="Subject field must be fill out." ControlToValidate="txtSubject" Style="color: red"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xs-12">
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1" id="lblMassage">Massage</label>
                            <asp:TextBox TextMode="MultiLine" ID="txtmassage" class="form-control" Rows="9" placeholder="Your massage here" runat="server" Style="resize: none; height: 220px !important"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorMassage" runat="server" ValidationGroup="submit" ErrorMessage="Massage field must be fill out." ControlToValidate="txtmassage" Style="color: red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <div class="row text-right" style="margin-right: 5px !important">
                    <div class="col-sm-12 col-xs-12">
                        <asp:Button ID="btnSubmit" class="btn btn-primary" Text="submit" ValidationGroup="submit" runat="server" OnClick="btnSubmit_Click" />
                    </div>
                </div>

                <div class="row margin-top">
                    <div class="col-md-8 col-sm-12">
                        <div class="embed-responsive embed-responsive-4by3">
                            <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14686.781365591463!2d72.500399!3d23.0349558!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xdc9d4dae36889fb9!2sTatvaSoft!5e0!3m2!1sen!2sin!4v1515672556288" width="600" height="450" frameborder="0" style="border: 0" allowfullscreen></iframe>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <h1>Get in touch</h1>
                        <address>
                            TatvaSoft House,<br />
                            Rajpath Club Road,
                            <br />
                            Near Shivalik Business Center,
                            <br />
                            Opp. Golf Academy,
                            <br />
                            Off S G Road,Ahmedabad,
                            <br />
                            Gujarat 380054.<br />
                            <br />
                            Phone:
                            <p class="display-inline color_red">(03)555 55555</p>
                            <br />
                            Email:
                            <p class="display-inline color_red">info@tatvasoft.com</p>
                        </address>
                    </div>
                </div>
            </div>

            <div class="col-sm-3 col-xs-12">
                <div class="row">
                    <div class="col-xs-12">
                        <a href="#">
                            <img class="margin image" src="images/promo1.jpg" alt="imgpromo1" />
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <a href="#">
                            <img src="images/promo2.jpg" alt="imgpromo2" class="image" />
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
