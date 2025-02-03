<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Task_Manager_2.Main" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task Manager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="Styles/StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="container">
            <div class="task-manager rounded-4">
                <!-- Top Bar -->
                <div class="top-bar d-flex p-2">
                    <div class="dropdown">
                        <button class="btn btn-dark" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Color
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </div>
                    <div class="light-dark-mode-switch d-flex align-items-center fs-3 mx-3">
                        <label class="sun">
                            <i class="fa-regular fa-sun"></i>
                        </label>

                        <div class="form-check form-switch mx-0">
                            <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" />
                        </div>

                        <label class="moon mx-0">
                            <i class="fa-regular fa-moon"></i>
                        </label>
                    </div>
                </div>
                <!-- Mid Bar -->
                <div class="mid-bar">
                    <asp:Button CssClass="btn btn-dark m-0 w-50 float-start rounded-0 border-1 border-light" ID="GroupsBtn" Text="Groups" runat="server" />
                    <asp:Button CssClass="btn btn-dark m-0 w-50 float-end rounded-0 border-1 border-light active" ID="TasksBtn" Text="Tasks" runat="server" />
                </div>
                <div class="contents mx-3 rounded-4 p-3">
                    <asp:Repeater ID="TasksRepeater" runat="server">
                        <ItemTemplate>
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <%# Container.DataItem %>
                                </li>
                            </ul>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="input-div d-flex justify-content-between w-100 p-3">
                    <asp:TextBox ID="TaskTB" runat="server" CssClass="form-control rounded-3 rounded-end-0 w-100" Placeholder="Studying Math, Cleaning the house, ..."></asp:TextBox>
                    <asp:LinkButton ID="AddTaskBtn" runat="server" CssClass="btn btn-success rounded-3 rounded-start-0" OnClick="AddTask">
                        <i class="fa-solid fa-check"></i>
                    </asp:LinkButton>
                </div>
            </div>
        </div>

        <asp:Label ID="Test" runat="server" Text=""></asp:Label>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/9d2324ac46.js" crossorigin="anonymous"></script>
</body>
</html>
