**Robot Framework Keywords Guide** **Table of Contents**

. Browser Management Keywords

. Element Interaction Keywords

. Input Keywords

. Veri cation Keywords

. Wait Keywords

. Navigation Keywords

. Window and Frame Keywords

. Alert Keywords

. Select Keywords

. Mouse Keywords

**Browser Management Keywords**

**Open Browser**

**Purpose**: Mở một trình duyệt mới với URL được chỉ định **Syntax**: Open Browser url browser alias options **Example**: Open Browser https://example.com chrome **Close Browser**

**Purpose**: Đóng trình duyệt hiện tại **Syntax**: Close Browser

**Example**: Close Browser

**Close All Browsers**

**Purpose**: Đóng tất cả các trình duyệt đang mở

**Syntax**: Close All Browsers

**Example**: Close All Browsers

**Element Interaction Keywords**

**Click Element**

**Purpose**: Click vào một element

**Syntax**: Click Element locator

**Example**: Click Element id=submit-button **Click Button**

Page 1 of 8

**Purpose**: Click vào một button **Syntax**: Click Button locator

**Example**: Click Button name=submit **Click Link**

**Purpose**: Click vào một link

**Syntax**: Click Link locator

**Example**: Click Link text=Click here **Click Image**

**Purpose**: Click vào một image

**Syntax**: Click Image locator

**Example**: Click Image alt=Logo

**Input Keywords**

**Input Text**

**Purpose**: Nhập text vào một text eld **Syntax**: Input Text locator text **Example**: Input Text id=username admin **Input Password**

**Purpose**: Nhập password vào một password eld **Syntax**: Input Password locator password **Example**: Input Password id=password 123456

**Clear Element Text**

**Purpose**: Xóa text trong một element **Syntax**: Clear Element Text locator **Example**: Clear Element Text id=search **Veri cation Keywords**

**Element Should Be Visible**

**Purpose**: Kiểm tra element có hiển thị không **Syntax**: Element Should Be Visible locator message **Example**: Element Should Be Visible id=welcome-message **Element Should Not Be Visible**

**Purpose**: Kiểm tra element không hiển thị

**Syntax**: Element Should Not Be Visible locator message Page 2 of 8

**Example**: Element Should Not Be Visible id=error-message **Element Should Be Enabled**

**Purpose**: Kiểm tra element có enabled không **Syntax**: Element Should Be Enabled locator message **Example**: Element Should Be Enabled id=submit-button **Element Should Be Disabled**

**Purpose**: Kiểm tra element có disabled không **Syntax**: Element Should Be Disabled locator message **Example**: Element Should Be Disabled id=submit-button **Element Should Contain**

**Purpose**: Kiểm tra element có chứa text không **Syntax**: Element Should Contain locator expected message **Example**: Element Should Contain id=message Welcome **Wait Keywords**

**Wait Until Element Is Visible**

**Purpose**: Đợi cho đến khi element hiển thị

**Syntax**: Wait Until Element Is Visible locator timeout error **Example**: Wait Until Element Is Visible id=loading 10s **Wait Until Element Is Not Visible**

**Purpose**: Đợi cho đến khi element không hiển thị

**Syntax**: Wait Until Element Is Not Visible locator timeout error **Example**: Wait Until Element Is Not Visible id=loading 10s **Wait Until Element Is Enabled**

**Purpose**: Đợi cho đến khi element enabled **Syntax**: Wait Until Element Is Enabled locator timeout error **Example**: Wait Until Element Is Enabled id=submit-button 10s **Navigation Keywords**

**Go To**

**Purpose**: Điều hướng đến một URL

**Syntax**: Go To url

**Example**: Go To https://example.com Page 3 of 8

**Go Back**

**Purpose**: Quay lại trang trước

**Syntax**: Go Back

**Example**: Go Back

**Go Forward**

**Purpose**: Đi đến trang tiếp theo **Syntax**: Go Forward

**Example**: Go Forward

**Window and Frame Keywords**

**Select Window**

**Purpose**: Chọn một window để thao tác **Syntax**: Select Window locator

**Example**: Select Window title=New Window **Select Frame**

**Purpose**: Chọn một frame để thao tác **Syntax**: Select Frame locator

**Example**: Select Frame id=main-frame **Unselect Frame**

**Purpose**: Thoát khỏi frame hiện tại **Syntax**: Unselect Frame

**Example**: Unselect Frame

**Alert Keywords**

**Handle Alert**

**Purpose**: Xử lý alert

**Syntax**: Handle Alert action timeout **Example**: Handle Alert accept 10s **Alert Should Be Present**

**Purpose**: Kiểm tra alert có hiển thị không **Syntax**: Alert Should Be Present text action **Example**: Alert Should Be Present Are you sure? accept **Select Keywords**

Page 4 of 8

**Select From List By Value** **Purpose**: Chọn option từ dropdown list theo value **Syntax**: Select From List By Value locator value **Example**: Select From List By Value id=country US

**Select From List By Label**

**Purpose**: Chọn option từ dropdown list theo label **Syntax**: Select From List By Label locator label **Example**: Select From List By Label id=country United States **Select From List By Index**

**Purpose**: Chọn option từ dropdown list theo index **Syntax**: Select From List By Index locator index **Example**: Select From List By Index id=country 1

**Mouse Keywords**

**Mouse Over**

**Purpose**: Di chuột qua element

**Syntax**: Mouse Over locator

**Example**: Mouse Over id=menu-item **Mouse Down**

**Purpose**: Nhấn chuột xuống

**Syntax**: Mouse Down locator

**Example**: Mouse Down id=button

**Mouse Up**

**Purpose**: Thả chuột ra

**Syntax**: Mouse Up locator

**Example**: Mouse Up id=button

**Drag And Drop**

**Purpose**: Kéo và thả element

**Syntax**: Drag And Drop source target **Example**: Drag And Drop id=source id=target **API Testing Keywords**

**Create Session**

Page 5 of 8

**Purpose**: Tạo một session mới để thực hiện các request **Syntax**: Create Session alias url headers cookies verify **Example**:

Create Session api https://api.example.com headers=\{'Content-Type': 'application/json'\} 

**Get Request**

**Purpose**: Thực hiện GET request

**Syntax**: Get Request alias uri headers params allow\_redirects **Example**:

$\{response\}= Get Request api /users/1 

**Post Request**

**Purpose**: Thực hiện POST request **Syntax**: Post Request alias uri data headers json params **Example**:

$\{response\}= Post Request api /users data=\{"name": "John", "age": 30\} 

**Put Request**

**Purpose**: Thực hiện PUT request

**Syntax**: Put Request alias uri data headers json params **Example**:

$\{response\}= Put Request api /users/1 data=\{"name": "John Updated"\} 

**Delete Request**

**Purpose**: Thực hiện DELETE request **Syntax**: Delete Request alias uri headers params **Example**:

$\{response\}= Delete Request api /users/1 

**Head Request**

**Purpose**: Thực hiện HEAD request **Syntax**: Head Request alias uri headers params **Example**:

$\{response\}= Head Request api /users/1 

**Options Request**

**Purpose**: Thực hiện OPTIONS request **Syntax**: Options Request alias uri headers params **Example**:

$\{response\}= Options Request api /users Page 6 of 8

**Patch Request**

**Purpose**: Thực hiện PATCH request **Syntax**: Patch Request alias uri data headers json params **Example**:

$\{response\}= Patch Request api /users/1 data=\{"name": "John"\} 

**Status Should Be**

**Purpose**: Kiểm tra status code của response **Syntax**: Status Should Be expected\_status msg **Example**:

Status Should Be 200 

**Should Be Equal As Strings**

**Purpose**: So sánh hai giá trị dạng string **Syntax**: Should Be Equal As Strings first second msg **Example**:

Should Be Equal As Strings $\{response.json\(\)\['name'\]\} John **Should Be Equal As Integers**

**Purpose**: So sánh hai giá trị dạng integer **Syntax**: Should Be Equal As Integers first second msg **Example**:

Should Be Equal As Integers $\{response.json\(\)\['age'\]\} 30 

**Dictionary Should Contain Item**

**Purpose**: Kiểm tra một key có tồn tại trong dictionary không **Syntax**: Dictionary Should Contain Item dictionary key value **Example**:

Dictionary Should Contain Item $\{response.json\(\)\} name John **Dictionary Should Not Contain Item**

**Purpose**: Kiểm tra một key không tồn tại trong dictionary **Syntax**: Dictionary Should Not Contain Item dictionary key **Example**:

Dictionary Should Not Contain Item $\{response.json\(\)\} error **Response Should Be JSON**

**Purpose**: Kiểm tra response có phải là JSON không **Syntax**: Response Should Be JSON response Page 7 of 8

**Example**:

Response Should Be JSON $\{response\} 

**Response Should Contain**

**Purpose**: Kiểm tra response có chứa text không **Syntax**: Response Should Contain response expected **Example**:

Response Should Contain $\{response\} John **Response Should Not Contain**

**Purpose**: Kiểm tra response không chứa text **Syntax**: Response Should Not Contain response expected **Example**:

Response Should Not Contain $\{response\} error **Set Headers**

**Purpose**: Thiết lập headers cho request **Syntax**: Set Headers alias headers **Example**:

Set Headers api \{'Authorization': 'Bearer token123'\} 

**Set Cookie**

**Purpose**: Thiết lập cookie cho request **Syntax**: Set Cookie alias name value **Example**:

Set Cookie api session abc123 

**Delete All Sessions**

**Purpose**: Xóa tất cả các sessions **Syntax**: Delete All Sessions

**Example**:

Delete All Sessions 

Page 8 of 8



