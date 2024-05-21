

<!--

# Dopamines
<h1 align="center">DB 구현 👍</h1>
> [플레이 데이터] 한화시스템 BEYOND SW캠프 / BOOT_UP

-->
<div align="center">
  <img src="https://github.com/beyond-sw-camp/be06-1st-Dopamines-BOOT_UP/assets/125132754/63bb8c42-2a83-42cb-b037-6d42a7d87404"  width="1000px" align="center"/>
</div>


<!--
==============Todo==============

🎬[CI/CD 시연영상](https://www.youtube.com/watch?v=dhMrKTwNI8U&lc=UgzCJR3WxkvsckRyyO94AaABAg&ab_channel=%EB%94%B0%EB%9D%BC%ED%95%98%EB%A9%B4%EC%84%9C%EB%B0%B0%EC%9A%B0%EB%8A%94IT)  
📃[프로젝트 회고록](블로그주소)

-->

## 📌 프로젝트 주제

> BOOT_UP 시스템은 한화 시스템 BEYOND SW캠프를 수강하는 학생들만을 위한 커뮤니티 기능을 주 목적으로 삼는다.
부가적으로 공지사항, 출결 알림, 스터디룸 예약 등의 기능을 통해 과정 간 편의성을 증진시켜준다.
이를 통해 BOOT_UP 시스템은 실속있는 부트캠프 관리 서비스를 제공한다.
<br>
<br>

## 🖼 배경

![Group 1410086963 (1)](https://github.com/beyond-sw-camp/be06-1st-Dopamines-BOOT_UP/assets/138289674/60eb3482-7b86-4de0-9247-98cd5eb6e070)



자체적인 플랫폼이 부재한 한화시스템 BEYOND SW캠프는 소통의 창구로 디스코드를 사용하고 있다. 위 플랫폼을 통해 공지사항이 전달되고  스터디 모집과 소통이 이루어지고 있다.
현 플랫폼인 디스코드는 오로지 “해당 기수"만의 소통창구로 이용되고 있다. 이는 전 기수간 혹은 취업준비를 하는 수료자들 간 소통이  불가하다는 점에서 불편함을 야기시킨다. 이에, 원내에서 원활히 사용할 수 있는 소통 및 커뮤니티 플랫폼을 구축하여 BEYOND SW캠프 기수 전체적으로 활동할 수 있는 창구를 마련하고자 한다.
<br>
<br>
## 📋 요구사항 정의서 / ERD

<summary> <b>요구사항 정의서</b> </summary>
</br>
<p>
  <a href= "https://github.com/beyond-sw-camp/be06-1st-Dopamines-BOOT_UP/wiki/%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD-%EC%A0%95%EC%9D%98%EC%84%9C">🔗 요구사항 정의서</a>
</p>

<summary> <b>ERD</b> </summary>
  
![Group 1410086964](https://github.com/beyond-sw-camp/be06-1st-Dopamines-BOOT_UP/assets/138289674/3aed8bb0-94f7-4d36-9092-8a6af2501c9f)



<br>

## 📚 기술 스택
### OS <img src="https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black"/> <img src="https://img.shields.io/badge/Vmware-607078?style=flat&logo=Vmware&logoColor=white"/>  <img src="https://img.shields.io/badge/CentOS-262577?style=flat&logo=CentOS&logoColor=white"/> 
### Database <img src="https://img.shields.io/badge/mariaDB-003545?style=flat&logo=mariaDB&logoColor=white"/> <img src="https://img.shields.io/badge/HAPROXY-blue?style=flat&logo=googlepubsub&logoColor=white"/> <img src="https://img.shields.io/badge/Keepalived-FF3E00?style=flat&logo=amazondynamodb&logoColor=white"/>


<br>

## 🖥️ 시스템 아키텍처

<div align="center">
  <img width="500px" alt="스크린샷 2024-05-21 오후 2 19 50" src="https://github.com/beyond-sw-camp/be06-1st-Dopamines-BOOT_UP/assets/138289674/cccf8db7-2fd3-4439-92cf-b4fd5ba75614">
</div>


<br>
<br>

## ✨ DR(재난 복구)

### 재난 복구 계획

본 DRP는 데이터베이스의 고가용성과 무중단 서비스를 제공하기 위한 재난 복구 절차를 설명한다.
<br>
<br>

#### 시스템 구성

- `Master Slave`:
커뮤니티 프로젝트 특성 상 게시글을 조회하는 select작업이 글을 작성하는 insert작업보다 주요적으로 요구된다. 이러한 점을 감안하였을 때, 읽기 작업을 slave 서버에 위임하는 것이 효율성을 증대시킬 수 있다고 판단하여 Master - Slave 구성을 채택하였다.

- `HAProxy`: 
슬레이브가 추가 될 시, 로드 밸런서로서 HAProxy를 활용한다. 쓰기작업은 Master에게, 읽기 작업을 각 Slave에게 분배하여 부하를 분산시킨다.
- `Keepalived`: 
다중으로 Master 서버를 구성시켰을 때, 유휴 상태로 인한 종료를 방지하기 위해 사용될 수 있다.
<br>
<br>

#### 재난 복구 시나리오

- `장애 탐지` : HAProxy가 주기적으로 노드 상태를 체크하여 장애를 감지.
- `장애 노드 격리`: HAProxy는 자동으로 장애 노드를 로드 밸런싱 풀에서 제외.
- `알림`: 시스템 관리자에게 장애 발생 사실을 이메일/문자로 알림.
<!--
==============Todo==============
- CI : 어떤 과정을 통해 자동으로 테스트 후 결과에 따라 통합 된다는 내용 추가
- CD : 어떤 과정을 통해자동으로 운영중인 서버에 무중단 배포 된다는 내용 추가
-->
<br>
<br>


## 👨‍💻 SQL 실행 결과
<!--
==============Todo==============
-->
<details>
<summary>회원 가입</summary>
<div>
<figure align="center"> 
  <img src="z"/>
    <p>~~~ 조회</p>
 </figure>
</div>

</details>

<details>
<summary>로그인</summary>
<div>
<figure align="center"> 
  <img src="z"/>
    <p>~~~ 조회</p>
 </figure>
</div>

</details>
<br>
<br>

## 🤼‍♂️팀원

### Members
<table>
  <tr>
    <td>
      <a href="https://github.com/syy0O">
        <img src="https://avatars.githubusercontent.com/u/86238720?v=4" width="100" style="max-width: 100%;">
      </a>
    </td>
    <td>
      <a href="https://github.com/SihyunSeo">
        <img src="https://avatars.githubusercontent.com/u/63051137?v=4" width="100" style="max-width: 100%;">
      </a>
    </td>
    <td>
      <a href="https://github.com/xeunnie">
        <img src="https://avatars.githubusercontent.com/u/138289674?v=4" width="100" style="max-width: 100%;">
      </a>
    </td>
    <td>
      <a href="https://github.com/subi930">
        <img src="https://avatars.githubusercontent.com/u/125132754?v=4" width="100" style="max-width: 100%;">
      </a>
    </td>
    <td>
      <a href="https://github.com/706com">
        <img src="https://avatars.githubusercontent.com/u/104816530?v=4" width="100" style="max-width: 100%;">
      </a>
    </td>
  </tr>
  <tr>
    <td align="center">
      <a href="https://github.com/syy0O">유송연</a>
    </td>
    <td align="center">
      <a href="https://github.com/SihyunSeo">서시현</a>
    </td>
    <td align="center">
      <a href="https://github.com/xeunnie">최승은</a>
    </td>
    <td align="center">
      <a href="https://github.com/subi930">최수빈</a>
    </td>
    <td align="center">
      <a href="https://github.com/706com">곽동현</a>
    </td>
  </tr>
</table>
<br>

<!--

Team Leader : 🐯**유철수**

Backend : 🐶 **김철수**

Backend : 🐺 **박철수**

Frontend : 🐱 **이철수**

인공지능 : 🦁 **최철수**

-->
