create table Water_Travel
(
  resultCode varchar2(3000),
  resultMsg varchar2(3000),
  course varchar2(3000),
  intro varchar2(3000),
  region varchar2(3000),
  regionCd varchar2(3000),
  searchType varchar2(3000),
  searchTypeCd varchar2(3000),
  title varchar2(3000),
  numOfRows varchar2(3000),
  PageNo varchar2(3000),
  totalCount varchar2(3000)
);

drop table WATER_TRAVEL;

select count(*) from diction where hnm like '%'|| '수'|| '%';

