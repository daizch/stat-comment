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
            width: 90%;
            margin: 10px auto;
            overflow: auto;
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
            background-color: #06213e;
            text-align: center;
            color: white;
        }
        tbody tr:hover {
            background-color: #0b388a;
        }

        tbody td {
            word-break: break-all;
        }
        .back-top {
            position: fixed;
            right: 10px;
            height: 35px;
            width: 35px;
            bottom: 0;
            font-size: 25px;
            color: white;
            text-decoration: none;
            background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEYAAABGCAYAAABxLuKEAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo3QkQzNTRERUVBNUUxMUUzODcyNzk2RTM5MkZCREQ2OSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo3QkQzNTRERkVBNUUxMUUzODcyNzk2RTM5MkZCREQ2OSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjdCRDM1NERDRUE1RTExRTM4NzI3OTZFMzkyRkJERDY5IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjdCRDM1NERERUE1RTExRTM4NzI3OTZFMzkyRkJERDY5Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+tblnnAAAAPBJREFUeNrs10EWgiAUBdDgtCP3vwTWRE2YlJXfo0F038iJHs/li49Ua73IcxIYMGDAgAEDBgwYMGDACBgwYMCAAQMGTDillHbZXiRF7l+W5ZT3yoMsUH1x3S15MJRhcHLnz6gGweaH+YDSHScPjNIVJw+O0g1nlL+SHvOmx+zK7D1muIABAwYMGDAT9pitjfbeO1KwAadI+23PNzEn5XrUgx5Xqk3EhhVMwfNRWmu+O89gJgYMmB/ZY76YeuTp3MT8wcSs/pVMjM0XjD0m2HBNzNSnazBgwFAAAwYMGDBgwIABAwaMgAEDBgyY7rkJMABdBLUSAt7mFQAAAABJRU5ErkJggg==) no-repeat;
            background-color: black;
            background-size: 100%;
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
            <th>remark</th>
            <th>desc</th>
            <th>location</th>
        </tr>
        </thead>
        <tbody>
            <!--content-->
        </tbody>
    </table>
</div>
<a href="#" class="back-top"></a>
</body>
</html>