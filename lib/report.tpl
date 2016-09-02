<!doctype html>
<html>
<head>
    <title>stat-report</title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        .report-content {
            width: 80%;
            margin: 10px auto;
        }

        table {
            width: 100%;
            border-spacing: 0;
            border-collapse: collapse;
            background-color: transparent;
        }

        table th {
            vertical-align: bottom;
            padding: 8px;
            border-top: 0;
        }

        tr {
            padding: 8px;
            line-height: 1.42857143;
            border-top: 1px solid #ddd;
            background-color: #268eff;
            text-align: center;
            color: white;
        }
        tbody tr:hover {
            background-color: #0b388a;
        }
    </style>
</head>
<body>
<div class="report-content">
    <table>
        <thead>
        <tr>
            <th>#</th>
            <th>name</th>
            <th>desc</th>
            <th>location</th>
        </tr>
        </thead>
        <tbody>
            <!--content-->
        </tbody>
    </table>
</div>
</body>
</html>