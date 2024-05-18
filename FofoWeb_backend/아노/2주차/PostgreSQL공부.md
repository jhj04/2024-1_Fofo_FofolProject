# PostgreSQL 시작하기

PostgreSQL과 pgAdmin 4 다운로드부터 `INSERT`, `DELETE`와 같은 기본 SQL 작업 실행, 새로운 테이블 생성, 초보자로써 만든 내 PostgreSQL 학습 기록에 오신 것을 환영합니다. 

## PostgreSQL 및 pgAdmin 4 시작하기
<img src="../2주차/images/image.png" alt="create_table" width="400"/>
### PostgreSQL 다운로드 및 설치

시작하는 방법은 다음과 같습니다:

1. **공식 PostgreSQL 웹사이트 방문**: [PostgreSQL 다운로드 페이지](https://www.postgresql.org/download/)로 이동합니다.
2. **운영 체제 선택**: 사용 중인 OS를 선택합니다(예: Windows, macOS, Linux). (저의 경우는 windows으로 진행합니다)
3. **인스톨러 다운로드**: Windows의 경우 EnterpriseDB에 의한 인터랙티브 인스톨러를 다운로드했습니다.
4. **인스톨러 실행**:  pgAdmin 4를 설치도 하도록 합니다.

### pgAdmin 4 설정하기
<img src="../2주차/images/pgAdmin4_QZQQtt0IaK.png" alt="create_table" width="400"/>
pgAdmin 4는 PostgreSQL을 위한 웹 기반 관리 도구입니다. 데이터베이스를 관리하기 위해 사용자 친화적인 인터페이스를 제공합니다.

- PostgreSQL 설치 후, pgAdmin 4가 자동으로 설정되었습니다.
- 시작 메뉴에서 pgAdmin 4를 실행했합니다.
- 실행 할 때 비밀번호를 요청하는데 이 비밀번호를 꼭 기억하셔야 됩니다.

## 기본 SQL 작업

### 새 테이블 생성하기

사용자 정보를 저장하기 위해 `users` 테이블을 만드는 것으로 시작했습니다.
(그리고 원래 VARCHAR(10) 같이 안 해도 되는 sql들이 있지만 우리가 쓰는 postgreSQL은 이렇게 데이터타입을 정해주는게 맞습니다.)

```sql
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(50),
  number VARCHAR(15),
  gender VARCHAR(10)
);

```
<img src="../2주차/images/create_table1.png" alt="create_table" width="300"/>

<img src="../2주차/images/create_table2.png" alt="create_table" width="300"/>

**SERIAL**은 자동 증가하는 정수 시퀀스에 사용됩니다.
**VARCHAR(n)**은 가변 길이 문자열을 지정합니다.

### 데이터 삽입하기

`users` 테이블에 데이터를 추가하는 것이 다음 단계였습니다. 이를 위해 `INSERT INTO` 문을 사용합니다.

```sql
INSERT INTO users (name, email, number, gender)
VALUES ('Anu', 'anu.bn@yahoo.com', '1234567890', '여성');
```

### 데이터 조회하기

데이터를 보려면 `SELECT` 문이 사용됩니다. `users` 테이블에서 모든 레코드를 검색하는 방법은 다음과 같습니다:

```sql
SELECT * FROM users;
```
<img src="../2주차/images/insert_values.png" alt="create_table" width="500"/>

### 데이터 업데이트하기

때로는 데이터를 업데이트해야 합니다. 사용자의 이메일을 업데이트하는 방법은 다음과 같습니다:

```sql
UPDATE users
SET email = 'new.email@example.com'
WHERE id = 1;
```
<img src="../2주차/images/update_data.png" alt="create_table" width="500"/>

### 테이블 삭제하기

데이터베이스에서 더 이상 필요하지 않은 테이블을 제거하고 싶을 때, `DROP TABLE` 문을 씁니다. 단, 조심하게 쓰지 않으면 안애 있는 모든 데이터가 삭제될 수 있습니다.

```sql
DROP TABLE users;
```
<img src="../2주차/images/drop_table.png" alt="create_table" width="300"/>

### 데이터 삭제하기

그리고 마지막으로 테이블에서 사용자를 삭제하는 방법:

```sql
DELETE FROM users
WHERE id = 1;
```
<img src="../2주차/images/delete_data.png" alt="create_table" width="300"/>

## 결론

이것은 PostgreSQL의 기분 시작이라고 볼 수 있습니다. 테이블 생성, 데이터 삽입, 조회, 업데이트, 삭제와 같은 이러한 기본 작업은 postgreSQL뿐만 아니라 모든 관계형 데이터베이스 작업의 기초를 형성합니다.

<img src="../2주차/images/PostgreSQL-Logo.wine.png" alt="create_table" width="400"/>



