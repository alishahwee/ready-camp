--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: activities; Type: TABLE; Schema: public; Owner: alishahwee
--

CREATE TABLE public.activities (
    id integer NOT NULL,
    park_id integer NOT NULL,
    activity character varying(100)
);


ALTER TABLE public.activities OWNER TO alishahwee;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: alishahwee
--

CREATE SEQUENCE public.activities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_id_seq OWNER TO alishahwee;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alishahwee
--

ALTER SEQUENCE public.activities_id_seq OWNED BY public.activities.id;


--
-- Name: blacklist_tokens; Type: TABLE; Schema: public; Owner: alishahwee
--

CREATE TABLE public.blacklist_tokens (
    id integer NOT NULL,
    token character varying(500) NOT NULL,
    blacklisted_on timestamp without time zone NOT NULL
);


ALTER TABLE public.blacklist_tokens OWNER TO alishahwee;

--
-- Name: blacklist_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: alishahwee
--

CREATE SEQUENCE public.blacklist_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blacklist_tokens_id_seq OWNER TO alishahwee;

--
-- Name: blacklist_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alishahwee
--

ALTER SEQUENCE public.blacklist_tokens_id_seq OWNED BY public.blacklist_tokens.id;


--
-- Name: checked_items; Type: TABLE; Schema: public; Owner: alishahwee
--

CREATE TABLE public.checked_items (
    id integer NOT NULL,
    park_id integer NOT NULL,
    user_id integer NOT NULL,
    item_id integer NOT NULL
);


ALTER TABLE public.checked_items OWNER TO alishahwee;

--
-- Name: checked_items_id_seq; Type: SEQUENCE; Schema: public; Owner: alishahwee
--

CREATE SEQUENCE public.checked_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checked_items_id_seq OWNER TO alishahwee;

--
-- Name: checked_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alishahwee
--

ALTER SEQUENCE public.checked_items_id_seq OWNED BY public.checked_items.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: alishahwee
--

CREATE TABLE public.favorites (
    id integer NOT NULL,
    park_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.favorites OWNER TO alishahwee;

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: alishahwee
--

CREATE SEQUENCE public.favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorites_id_seq OWNER TO alishahwee;

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alishahwee
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: alishahwee
--

CREATE TABLE public.images (
    id integer NOT NULL,
    park_id integer NOT NULL,
    url character varying
);


ALTER TABLE public.images OWNER TO alishahwee;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: alishahwee
--

CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO alishahwee;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alishahwee
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: alishahwee
--

CREATE TABLE public.items (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_rainy boolean,
    is_winter boolean,
    is_optional boolean NOT NULL,
    category character varying(20) NOT NULL
);


ALTER TABLE public.items OWNER TO alishahwee;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: alishahwee
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO alishahwee;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alishahwee
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: parks; Type: TABLE; Schema: public; Owner: alishahwee
--

CREATE TABLE public.parks (
    id integer NOT NULL,
    name character varying NOT NULL,
    address character varying,
    coordinates character varying NOT NULL,
    url character varying NOT NULL
);


ALTER TABLE public.parks OWNER TO alishahwee;

--
-- Name: parks_id_seq; Type: SEQUENCE; Schema: public; Owner: alishahwee
--

CREATE SEQUENCE public.parks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parks_id_seq OWNER TO alishahwee;

--
-- Name: parks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alishahwee
--

ALTER SEQUENCE public.parks_id_seq OWNED BY public.parks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: alishahwee
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    password character varying NOT NULL,
    email character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO alishahwee;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: alishahwee
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO alishahwee;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alishahwee
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: activities id; Type: DEFAULT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.activities ALTER COLUMN id SET DEFAULT nextval('public.activities_id_seq'::regclass);


--
-- Name: blacklist_tokens id; Type: DEFAULT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.blacklist_tokens ALTER COLUMN id SET DEFAULT nextval('public.blacklist_tokens_id_seq'::regclass);


--
-- Name: checked_items id; Type: DEFAULT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.checked_items ALTER COLUMN id SET DEFAULT nextval('public.checked_items_id_seq'::regclass);


--
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: parks id; Type: DEFAULT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.parks ALTER COLUMN id SET DEFAULT nextval('public.parks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: alishahwee
--

COPY public.activities (id, park_id, activity) FROM stdin;
1	1	Backpack Camping
2	1	Fishing 
3	1	Swimming
4	1	Prairie Landscape
5	1	Hiking
6	1	Cross-Country Skiing
7	2	Kettle River
8	2	Canoeing
9	2	Historic Sandstone Quarry
10	2	Wolf Creek Falls
11	2	Hiking
12	2	Kayaking
13	3	Camping
14	3	Fishing
15	3	Great Hiking Trails
16	3	Wilderness Atmosphere
17	3	Wildlife
18	3	23 Miles of Lakeshore
19	4	Camping
20	4	Trout Fishing
21	4	Hiking
22	4	Bird Watching
23	4	Spring Woodland Flowers
24	4	The "Big Spring"
25	5	Lakeside Campsites
26	5	Fishing
27	5	Bird Watching
28	5	Native Prairie/Oak Savanna in Scientific and Natural Area
29	5	Wildflowers Spring/Summer
30	6	Camping
31	6	Hiking
32	6	Rock Climbing
33	6	Wildlife
34	6	Bison Herd
35	6	Prairie Wildflowers / Grasses
36	7	Swimming Beach 
37	7	Great Picnicking
38	7	Camping
39	7	Fishing
40	7	Native Prairie Landscape
41	8	Camping
42	8	Fishing
43	8	Fall Colors
44	8	Dakota Overlook
45	8	Wildflowers
46	8	Native and Restored Prairies
47	9	Camping
48	9	Fishing/Trout Stream
49	9	Spring Wildflowers
50	9	Hiking
51	9	White Pine Stands
52	9	Bluebells in May
53	10	Hiking
54	10	Camping
55	10	Skiing
56	10	Waterfalls
57	10	Fishing
58	10	Scenic areas along river and lake
59	11	Camping
60	11	Historic Site
61	11	Picnicking
62	11	Spring Wildflowers
63	11	Mississippi River
64	11	Great Family Reunion Park
65	12	Camping
66	12	Fishing
67	12	Scenic Hiking Trails
68	12	Historic Sites
69	12	Canoeing/Mississippi River
70	12	Great Wildlife Observation Opportunities
71	13	Camping
72	13	Fishing
73	13	Wheelchair Accessible Fishing Piers
74	13	Sandy Beach
75	13	Home of Several Albino Deer
76	14	Shaded Campsites
77	14	Sand-bottom Swimming Pool
78	14	Enclosed Picnic Shelter
79	14	Scenic Overlooks
80	14	Hiking/Cross-Country Skiing
81	14	Modern Group Center
82	15	Tours of Mystery Cave
83	15	Historic Forestville Tours
84	15	Trout Streams
85	15	Camping
86	15	Great Hiking/Horseback Trails
87	15	Spring Flowers
88	16	Camping
89	16	Historic Site
90	16	Horseback Riding
91	16	Scenic Rolling Hills
92	16	Forests and Prairies
93	17	Fishing
94	17	Hiking
95	17	Dakota Memorial
96	17	Interpretive Exhibits
97	17	Bike Trails/Connections
98	17	Cross-Country Skiing
99	18	Great Fishing
100	18	Hiking
101	18	Quiet
102	18	Peaceful Park
103	18	Scenic Hiking Trails
104	19	Camping
105	19	Wonderful Fall Colors 
106	19	Excellent Birding Opportunities
107	19	Wildflowers in Spring Through Fall
108	19	Winter Sliding Hill
109	19	Great Hiking/Ski Trails
110	20	Camping
111	20	Hiking
112	20	Scenic views
113	20	Waterfalls
114	20	Wildlife
115	21	Camping
116	21	Fishing
117	22	Cart-in Tent Camping
118	22	Hiking and Biking
119	22	Wildlife Observation
120	22	Heritage Fishing/Large Panfish
121	22	Canoeing on Chain of Lakes
122	22	Sandy Swimming Beach
123	23	Scenic Waterfalls/Lake Superior Shoreline
124	23	Visitor Center/Nature Store
125	23	Historic CCC Log & Stone Structures
126	23	Year-Round Naturalist
127	23	Multi-Use/Accessible Trails
128	23	Gateway Plaza
129	24	Minnesota's Highest Waterfall
130	24	Hiking
131	24	Scenic Views
132	24	Picnicking
133	24	Spring/Summer Wildflowers
134	25	Scenic Blufftop Views of Mississippi River Valley
135	25	Fall Colors
136	25	Goat Prairies
137	25	 Prairie Plants/Flowers
138	25	Camping/Hiking/Picnicking
139	25	Birdwatching
140	26	Scenic Views: Grefthen Bay Overlook
141	26	Hayes Dam Area
142	26	New Bog Boardwalk
143	26	History Trail
144	26	Great Wildlife Observation
145	26	Timberwolves
146	27	Tours of Mine/Facilities
147	27	Historic Site
148	27	Clubhouse Museum
149	27	Scenic Overlook
150	27	Picnicking
151	27	Fossil Hunt
152	28	Scenic River Views
153	28	Canoeing
154	28	Camping
155	28	Fishing
156	28	Rock Climbing
157	28	Pothole Viewing
158	29	Camping
159	29	Fishing
160	29	Hiking
161	29	Historic Sites
162	29	Unique Ecosystem
163	29	 Old Growth
164	30	Camping
165	30	Hiking
166	30	Swinging Bridge
167	30	Pioneer Cemetery
168	30	Thomson Dam
169	30	Oldenburg Point
170	31	Scenic Views
171	32	Scenic Waterfalls
172	32	Trout Fishing
173	32	Camping
174	32	Hiking/Picnicking
175	32	Wildlife Observation
176	32	Superior Hiking Trail
177	33	Peaceful/Quiet Park
178	33	Birdwatching
179	33	Hiking
180	33	Camping
181	33	Spring Wildflowers
182	34	Camping
183	34	Fishing
184	34	Bird Watching/Winter Eagle Sightings
185	34	Hunting
186	34	Canoeing
187	34	Cross-country Skiing
188	35	Camping
189	35	Fishing
190	35	Unique Ecosystem
191	35	Bog Walk
192	35	Eagle/Osprey Viewing
193	35	Lake Recreation
194	36	Largest Observation/Water Tower in MN State Park System
195	36	Historic WPA-Built Structures
196	36	Playground
197	36	Excellent Prairie & Aspen Parkland Habitat
198	36	Camping/Hiking 
199	36	Visitor Center
200	37	Camping
201	37	Fishing on Chain of Lakes
202	37	Birdwatching
203	37	Hiking Through Rolling Hills
204	37	Swimming/Boating
205	37	Water Recreation
206	38	Quiet Park
207	38	Seasonal Wildflowers
208	38	Peaceful Campgrounds
209	38	Canoeing on Lake Louise
210	38	Swimming Beach
211	38	Horse Trails Through Varied Habitat
212	39	Secluded Backpack Campsites
213	39	Endangered Blandings Turtle
214	39	Hiking/Spring Wildflowers/Fall Colors
215	39	Nesting Osprey and Eagles 
216	39	Remote Ski-in/Walk-in Camper Cabins
217	39	Cross-Country Skiing
218	40	Camping
219	40	Fishing
220	40	Bicycle Trail 
221	40	Shetek Monument and Koch Cabin
222	41	Mine Tours and Hiking
223	41	Campground and Day Use Areas
224	41	Historic Site
225	41	Lake Recreation and Public Water Access
226	41	Geologic Formations
227	41	Birding and Wildlife Watching
228	42	Swimming Beach
229	42	Camping
230	42	Hiking
231	42	Horse Trails
232	42	Picnicking
233	42	Snowshoeing/snowmobiling
234	43	Camping
235	43	Fishing
236	43	Hiking
237	43	Horseback Trails
238	44	Nature Programs
239	44	Camping
240	44	Swimming/Playground
241	44	100 Ft. Observation Tower
242	44	Historic Sites
243	44	Cross-Country Skiing
244	45	Camping
245	45	Fishing
246	45	Bison herd
247	46	Camping
248	46	Fishing
249	47	Close Access To Recreation
250	47	Quiet Lake Offers Great Canoeing
251	47	Lots Of Family Activity Choices
252	47	Fishing/Fishing Pier
253	47	Wildflowers & Wildlife Viewing
254	48	Spring and Fall Migrations
255	48	Glacial Esker
256	48	Great Marsh/Birdwatching
257	48	Hiking
258	48	Canoeing
259	48	Camping
260	49	"Big Woods" Landscape
261	49	Spectacular Spring Wildflowers
262	49	Fabulous Fall Color
263	49	Visitor Center
264	49	Self-guided Interpretive Trail
265	49	Hidden Falls Waterfall
266	50	Camping
267	50	Wildlife
268	50	Historic Site
269	51	Spring and Fall Migration
270	51	Birdwatching
271	51	Great Variety of Songbirds/Waterfowl
272	51	Wildflowers
273	51	Canoeing
274	51	Nature Observation
275	52	Camping
276	52	Extensive Trail System
277	52	CCC Construction Buildings
278	52	Two Scenic Rivers Offer Excellent Canoeing
279	52	Birding/Wildlife Observation
280	52	Firetower
281	53	Maple and Basswood Forests
282	53	Hiking
283	53	Biking - Access to Sakatah State Trail
284	53	Camping
285	53	Wildlife
286	54	Hiking Trails
287	54	Swimming Beach
288	54	Fishing
289	54	Continental Divide
290	54	Snowmobiling
291	54	Historic Areas in Park
292	55	Camping
293	55	Hiking
294	55	Virgin Pines
295	55	Peaceful Setting
296	55	Fishing/Canoeing
297	55	Historic CCC Buildings
298	56	Camping
299	56	Hiking
300	56	Canoeing
301	56	Picnicking
302	56	Fishing 
303	56	Quiet Park/Great Relaxation
304	57	Interpretive Programs
305	57	Bird Watching
306	57	Camping
307	57	Fishing/Canoeing
308	57	Hiking
309	57	Cross-Country Skiing
310	58	Camping
311	58	Water Based Recreation / Swimming Beach
312	58	Fishing
313	58	Wildlife/Waterfowl Observation
314	58	Hiking
315	58	Horse riding trails
316	59	Tent Camping/Cart-in Sites
317	59	Historic Lighthouse / History Center Tours
318	59	Picnicking Along Lake Superior Lakeshore
319	59	Scenic Views of Lake Superior
320	59	Waterfalls
321	60	Rock Climbing
322	60	Fishing
323	60	Hiking
324	60	Camping
325	60	Many Scenic Areas Along River and Lake
326	60	Rocky Landscape
327	61	Waterfalls
328	61	Wildlife/Peregrine Falcons
329	61	Hiking
330	61	Camping
331	61	Rock Climbing
332	61	Cross-Country Skiing
333	62	Camping Including Tipi Sites
334	62	Historic Site
335	62	Horse Trails/Camp
336	62	Varied Landscape/Hiking Trails
337	62	Birdwatching
338	63	Rugged Hiking Trails to Scenic Bluffland
339	63	Noticeable Lack of Mosquitoes
340	63	Excellent Trout Fishing summer and winter
341	63	Year-round Interpretive Programs
342	63	Visitor Center
343	63	Spectacular Spring Wildflowers
344	64	Camping
345	64	Canoeing
346	64	Cross-Country Skiing
347	64	McElroy Visitor Center
348	64	Nevers Dam Overlook
349	64	Wildlife/Wildflowers
350	65	Camping/Fishing
351	65	Canoeing on the St. Croix
352	65	Cross-country Skiing
353	65	Naturalist Programs
354	65	Bird Watching
355	65	Oak Savanna Restoration
356	66	Camping
357	66	Fishing
358	66	Beach
359	66	Bird Watching
360	66	Winter Recreation
\.


--
-- Data for Name: blacklist_tokens; Type: TABLE DATA; Schema: public; Owner: alishahwee
--

COPY public.blacklist_tokens (id, token, blacklisted_on) FROM stdin;
\.


--
-- Data for Name: checked_items; Type: TABLE DATA; Schema: public; Owner: alishahwee
--

COPY public.checked_items (id, park_id, user_id, item_id) FROM stdin;
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: alishahwee
--

COPY public.favorites (id, park_id, user_id) FROM stdin;
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: alishahwee
--

COPY public.images (id, park_id, url) FROM stdin;
1	1	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00100.jpg
2	1	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00100_001.jpg
3	1	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00100_002.jpg
4	1	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00100_003.jpg
5	1	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00100_004.jpg
6	1	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00100_005.jpg
7	1	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00100_006.jpg
8	2	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00103.jpg
9	2	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00103_001.jpg
10	2	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00103_002.jpg
11	2	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00103_003.jpg
12	2	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00103_004.jpg
13	2	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00103_005.jpg
14	2	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00103_006.jpg
15	3	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00109.jpg
16	3	https://images.dnr.state.mn.us/destinations/state_parks/1_large/bear_head_lake_1.jpg
17	3	https://images.dnr.state.mn.us/destinations/state_parks/1_large/bear_head_lake_2.jpg
18	3	https://images.dnr.state.mn.us/destinations/state_parks/1_large/bear_head_lake_3.jpg
19	3	https://images.dnr.state.mn.us/destinations/state_parks/1_large/bear_head_lake_4.jpg
20	3	https://images.dnr.state.mn.us/destinations/state_parks/1_large/bear_head_lake_5.jpg
21	3	https://images.dnr.state.mn.us/destinations/state_parks/1_large/bear_head_lake_6.jpg
22	4	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00112.jpg
23	4	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00112_001.jpg
24	4	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00112_002.jpg
25	4	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00112_003.jpg
26	4	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00112_004.jpg
27	4	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00112_005.jpg
28	4	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00112_006.jpg
29	5	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00115.jpg
30	5	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00115_001.jpg
31	5	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00115_002.jpg
32	5	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00115_003.jpg
33	5	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00115_004.jpg
34	5	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00115_005.jpg
35	5	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00115_006.jpg
36	6	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00121.jpg
37	6	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00121_001.jpg
38	6	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00121_002.jpg
39	6	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00121_003.jpg
40	6	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00121_004.jpg
41	6	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00121_005.jpg
42	6	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00121_006.jpg
43	7	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00124.jpg
44	7	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00124_001.jpg
45	7	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00124_002.jpg
46	7	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00124_003.jpg
47	7	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00124_004.jpg
48	7	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00124_005.jpg
49	7	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00124_006.jpg
50	8	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00127.jpg
51	8	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00127_001.jpg
52	8	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00127_002.jpg
53	8	https://images.dnr.state.mn.us/destinations/state_parks/1_large/camden_redwood_exterior.jpg
54	8	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00127_004.jpg
55	8	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00127_005.jpg
56	8	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00127_006.jpg
57	9	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00130.jpg
58	9	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00130_001.jpg
59	9	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00130_002.jpg
60	9	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00130_003.jpg
61	9	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00130_004.jpg
62	9	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00130_005.jpg
63	9	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00130_006.jpg
64	10	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00133.jpg
65	10	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00133_001.jpg
66	10	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00133_002.jpg
67	10	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00133_003.jpg
68	10	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00133_004.jpg
69	10	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00133_005.jpg
70	10	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00133_006.jpg
71	11	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00136.jpg
72	11	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00136_001.jpg
73	11	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00136_002.jpg
74	11	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00136_003.jpg
75	11	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00136_004.jpg
76	11	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00136_005.jpg
77	11	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00136_006.jpg
78	12	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00139.jpg
79	12	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00139_001.jpg
80	12	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00139_002.jpg
81	12	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00139_003.jpg
82	12	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00139_004.jpg
83	12	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00139_005.jpg
84	12	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00139_006.jpg
85	13	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00142.jpg
86	13	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00142_012.jpg
87	13	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00142_010.jpg
88	13	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00142_011.jpg
89	13	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00142_001.jpg
90	13	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00142_003.jpg
91	13	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00142_006.jpg
92	14	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00145.jpg
93	14	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00145_001.jpg
94	14	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00145_002.jpg
95	14	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00145_003.jpg
96	14	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00145_004.jpg
97	14	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00145_005.jpg
98	14	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00145_006.jpg
99	15	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00148.jpg
100	15	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00148_001.jpg
101	15	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00148_002.jpg
102	15	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00148_003.jpg
103	15	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00148_004.jpg
104	15	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00148_005.jpg
105	15	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00148_006.jpg
106	16	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00151.jpg
107	16	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00151_011.jpg
108	16	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00151_001.jpg
109	16	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00151_010.jpg
110	16	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00151_007.jpg
111	16	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00151_003.jpg
112	16	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00151_012.jpg
113	17	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00154.jpg
114	17	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00154_008.jpg
115	17	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00154_001.jpg
116	17	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00154_007.jpg
117	17	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00154_005.jpg
118	17	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00154_002.jpg
119	17	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00154_003.jpg
120	18	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00157.jpg
121	18	https://images.dnr.state.mn.us/destinations/state_parks/1_large/franz_jevne_1.jpg
122	18	https://images.dnr.state.mn.us/destinations/state_parks/1_large/franz_jevne_2.jpg
123	18	https://images.dnr.state.mn.us/destinations/state_parks/1_large/franz_jevne_3.jpg
124	18	https://images.dnr.state.mn.us/destinations/state_parks/1_large/franz_jevne_4.jpg
125	18	https://images.dnr.state.mn.us/destinations/state_parks/1_large/franz_jevne_5.jpg
126	18	https://images.dnr.state.mn.us/destinations/state_parks/1_large/franz_jevne_6.jpg
127	19	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00160.jpg
128	19	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00160_001.jpg
129	19	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00160_002.jpg
130	19	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00160_003.jpg
131	19	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00160_004.jpg
132	19	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00160_005.jpg
133	19	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00160_006.jpg
134	20	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00163.jpg
135	20	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00163_001.jpg
136	20	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00163_002.jpg
137	20	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00163_003.jpg
138	20	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00163_004.jpg
139	20	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00163_005.jpg
140	20	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00163_006.jpg
141	21	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00166.jpg
142	21	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00166_001.jpg
143	21	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00166_002.jpg
144	21	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00166_003.jpg
145	21	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00166_004.jpg
146	21	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00166_005.jpg
147	21	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00166_006.jpg
148	22	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00167.jpg
149	22	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00167_007.jpg
150	22	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00167_008.jpg
151	22	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00167_009.jpg
152	22	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00167_010.jpg
153	22	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00167_011.jpg
154	22	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00167_012.jpg
155	23	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00172.jpg
156	23	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00172_001.jpg
157	23	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00172_002.jpg
158	23	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00172_003.jpg
159	23	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00172_004.jpg
160	23	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00172_005.jpg
161	23	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00172_006.jpg
162	24	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00173.jpg
163	24	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00173_001.jpg
164	24	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00173_002.jpg
165	24	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00173_003.jpg
166	24	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00173_004.jpg
167	24	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00173_005.jpg
168	24	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00173_006.jpg
169	25	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00244.jpg
170	25	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00244_001.jpg
171	25	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00244_002.jpg
172	25	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00244_003.jpg
173	25	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00244_004.jpg
174	25	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00244_005.jpg
175	25	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00244_006.jpg
176	26	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00174.jpg
177	26	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00174_001.jpg
178	26	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00174_002.jpg
179	26	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00174_003.jpg
180	26	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00174_004.jpg
181	26	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00174_005.jpg
182	26	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00174_006.jpg
183	27	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00176.jpg
184	27	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00176_001.jpg
185	27	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00176_002.jpg
186	27	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00176_003.jpg
187	27	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00176_004.jpg
188	27	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00176_005.jpg
189	27	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00176_006.jpg
190	28	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00178.jpg
191	28	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00178_001.jpg
192	28	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00178_002.jpg
193	28	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00178_003.jpg
194	28	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00178_004.jpg
195	28	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00178_005.jpg
196	28	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00178_006.jpg
197	29	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00181.jpg
198	29	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00181_001a.jpg
199	29	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00181_010.jpg
200	29	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00181_009.jpg
201	29	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00181_003.jpg
202	29	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00181_004.jpg
203	29	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00181_005.jpg
204	30	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00187.jpg
205	30	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00187_001.jpg
206	30	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00187_002.jpg
207	30	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00187_003.jpg
208	30	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00187_004.jpg
209	30	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00187_005.jpg
210	30	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00187_006.jpg
211	31	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00177.jpg
212	31	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00177_001.jpg
213	31	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00177_002.jpg
214	31	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00177_003.jpg
215	31	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00177_004.jpg
216	31	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00177_005.jpg
217	31	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00177_006.jpg
218	32	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00193.jpg
219	32	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00193_001.jpg
220	32	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00193_002.jpg
221	32	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00193_003.jpg
222	32	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00193_004.jpg
223	32	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00193_005.jpg
224	32	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00193_006.jpg
225	33	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00196.jpg
226	33	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00196_001.jpg
227	33	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00196_002.jpg
228	33	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00196_003.jpg
229	33	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00196_004.jpg
230	33	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00196_005.jpg
231	33	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00196_006.jpg
232	34	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00197.jpg
233	34	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00197_001.jpg
234	34	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00197_002.jpg
235	34	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00197_003.jpg
236	34	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00197_004.jpg
237	34	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00197_005.jpg
238	34	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00197_006.jpg
239	35	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00205.jpg
240	35	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00205_007.jpg
241	35	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00205_001.jpg
242	35	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00205_008.jpg
243	35	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00205_002.jpg
244	35	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00205_003.jpg
245	35	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00205_004.jpg
246	36	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00208.jpg
247	36	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00208_001.jpg
248	36	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00208_002.jpg
249	36	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00208_003.jpg
250	36	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00208_004.jpg
251	36	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00208_005.jpg
252	36	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00208_006.jpg
253	37	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00211.jpg
254	37	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00211_spring_pelicans.jpg
255	37	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00211_spring_campercabin.jpg
256	37	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00211_spring_marshmarigold.jpg
257	37	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00211_spring_turtle.jpg
258	37	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00211_spring_fawn.jpg
259	37	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00211_spring_fishing.jpg
260	38	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00214.jpg
261	38	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00214_001.jpg
262	38	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00214_002.jpg
263	38	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00214_003.jpg
264	38	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00214_004.jpg
265	38	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00214_005.jpg
266	38	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00214_006.jpg
267	39	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00217.jpg
268	39	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00217_001.jpg
269	39	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00217_002.jpg
270	39	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00217_003.jpg
271	39	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00217_004.jpg
272	39	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00217_005.jpg
273	39	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00217_006.jpg
274	40	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00220.jpg
275	40	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00220_001.jpg
276	40	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00220_002.jpg
277	40	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00220_003.jpg
278	40	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00220_004.jpg
279	40	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00220_005.jpg
280	40	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00220_006.jpg
281	41	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00285.jpg
282	41	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00285_001.jpg
283	41	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00285_002.jpg
284	41	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00285_003.jpg
285	41	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00285_004.jpg
286	41	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00285_005.jpg
287	41	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00285_006.jpg
288	42	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00226.jpg
289	42	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00226_002.jpg
290	42	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00226_003.jpg
291	42	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00226_004.jpg
292	42	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00226_005.jpg
293	42	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00226_006.jpg
294	43	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00229.jpg
295	43	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00229_007.jpg
296	43	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00229_001.jpg
297	43	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00229_002.jpg
298	43	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00229_003.jpg
299	43	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00229_004.jpg
300	43	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00229_005.jpg
301	44	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00232.jpg
302	44	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00232_001.jpg
303	44	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00232_002.jpg
304	44	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00232_003.jpg
305	44	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00232_004.jpg
306	44	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00232_005.jpg
307	44	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00232_006.jpg
308	45	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00235.jpg
309	45	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00235_007.jpg
310	45	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00235_001.jpg
311	45	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00235_002.jpg
312	45	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00235_003.jpg
313	45	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00235_004.jpg
314	45	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00235_005.jpg
315	46	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00238.jpg
316	46	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00238_001.jpg
317	46	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00238_002.jpg
318	46	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00238_003.jpg
319	46	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00238_004.jpg
320	46	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00238_005.jpg
321	46	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00238_006.jpg
322	47	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00239.jpg
323	47	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00239_001.jpg
324	47	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00239_002.jpg
325	47	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00239_003.jpg
326	47	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00239_004.jpg
327	47	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00239_005.jpg
328	47	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00239_006.jpg
329	48	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00175.jpg
330	48	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00175_001.jpg
331	48	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00175_002.jpg
332	48	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00175_003.jpg
333	48	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00175_004.jpg
334	48	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00175_005.jpg
335	48	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00175_006.jpg
336	49	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00241.jpg
337	49	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00241_001.jpg
338	49	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00241_002.jpg
339	49	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00241_003.jpg
340	49	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00241_004.jpg
341	49	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00241_005.jpg
342	49	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00241_006.jpg
343	50	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00247.jpg
344	50	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00247_001.jpg
345	50	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00247_002.jpg
346	50	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00247_003.jpg
347	50	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00247_004.jpg
348	50	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00247_005.jpg
349	50	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00247_006.jpg
350	51	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00250.jpg
351	51	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00250_001.jpg
352	51	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00250_002.jpg
353	51	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00250_003.jpg
354	51	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00250_004.jpg
355	51	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00250_005.jpg
356	51	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00250_006.jpg
357	52	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00253.jpg
358	52	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00253_001.jpg
359	52	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00253_002.jpg
360	52	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00253_003.jpg
361	52	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00253_004.jpg
362	52	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00253_005.jpg
363	52	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00253_006.jpg
364	53	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00256.jpg
365	53	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00256_001.jpg
366	53	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00256_002.jpg
367	53	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00256_003.jpg
368	53	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00256_004.jpg
369	53	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00256_005.jpg
370	53	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00256_006.jpg
371	54	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00259.jpg
372	54	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00259_001.jpg
373	54	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00259_002.jpg
374	54	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00259_003.jpg
375	54	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00259_004.jpg
376	54	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00259_005.jpg
377	54	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00259_006.jpg
378	55	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00262.jpg
379	55	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00262_001.jpg
380	55	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00262_002.jpg
381	55	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00262_003.jpg
382	55	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00262_004.jpg
383	55	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00262_005.jpg
384	55	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00262_006.jpg
385	56	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00263.jpg
386	56	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00263_001.jpg
387	56	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00263_002.jpg
388	56	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00263_003.jpg
389	56	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00263_004.jpg
390	56	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00263_005.jpg
391	56	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00263_006.jpg
392	57	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00265.jpg
393	57	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00265_001.jpg
394	57	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00265_002.jpg
395	57	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00265_003.jpg
396	57	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00265_004.jpg
397	57	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00265_005.jpg
398	57	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00265_006.jpg
399	58	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00267.jpg
400	58	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00267_001.jpg
401	58	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00267_002.jpg
402	58	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00267_003.jpg
403	58	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00267_004.jpg
404	58	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00267_005.jpg
405	58	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00267_006.jpg
406	59	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00266.jpg
407	59	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00266_001.jpg
408	59	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00266_002.jpg
409	59	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00266_003.jpg
410	59	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00266_004.jpg
411	59	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00266_005.jpg
412	59	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00266_006.jpg
413	60	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00268.jpg
414	60	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00268_001.jpg
415	60	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00268_002.jpg
416	60	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00268_003.jpg
417	60	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00268_004.jpg
418	60	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00268_005.jpg
419	60	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00268_006.jpg
420	61	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00269.jpg
421	61	https://images.dnr.state.mn.us/destinations/state_parks/1_large/tettegouche_8.jpg
422	61	https://images.dnr.state.mn.us/destinations/state_parks/1_large/tettegouche_1.jpg
423	61	https://images.dnr.state.mn.us/destinations/state_parks/1_large/tettegouche_2.jpg
424	61	https://images.dnr.state.mn.us/destinations/state_parks/1_large/tettegouche_3.jpg
425	61	https://images.dnr.state.mn.us/destinations/state_parks/1_large/tettegouche_4.jpg
426	61	https://images.dnr.state.mn.us/destinations/state_parks/1_large/tettegouche_5.jpg
427	62	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00277.jpg
428	62	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00277_001.jpg
429	62	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00277_002.jpg
430	62	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00277_003.jpg
431	62	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00277_004.jpg
432	62	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00277_005.jpg
433	62	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00277_006.jpg
434	63	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00280.jpg
435	63	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00280_001.jpg
436	63	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00280_002.jpg
437	63	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00280_003.jpg
438	63	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00280_004.jpg
439	63	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00280_005.jpg
440	63	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00280_006.jpg
441	64	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00254.jpg
442	64	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00254_001.jpg
443	64	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00254_002.jpg
444	64	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00254_003.jpg
445	64	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00254_004.jpg
446	64	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00254_005.jpg
447	64	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00254_006.jpg
448	65	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00283.jpg
449	65	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00283_001.jpg
450	65	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00283_002.jpg
451	65	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00283_003.jpg
452	65	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00283_004.jpg
453	65	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00283_005.jpg
454	65	https://images.dnr.state.mn.us/destinations/state_parks/1_large/SPK00283_006.jpg
455	66	https://images.dnr.state.mn.us/destinations/state_parks/banners/spk00284.jpg
456	66	https://images.dnr.state.mn.us/destinations/state_parks/1_large/zippel_bay_1.jpg
457	66	https://images.dnr.state.mn.us/destinations/state_parks/1_large/zippel_bay_2.jpg
458	66	https://images.dnr.state.mn.us/destinations/state_parks/1_large/zippel_bay_3.jpg
459	66	https://images.dnr.state.mn.us/destinations/state_parks/1_large/zippel_bay_4.jpg
460	66	https://images.dnr.state.mn.us/destinations/state_parks/1_large/zippel_bay_5.jpg
461	66	https://images.dnr.state.mn.us/destinations/state_parks/1_large/zippel_bay_6.jpg
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: alishahwee
--

COPY public.items (id, name, is_rainy, is_winter, is_optional, category) FROM stdin;
1	Tent	\N	f	f	Campsite
2	Sleeping bags	\N	f	f	Campsite
3	Sleeping pads	\N	f	f	Campsite
4	Camping pillow	\N	\N	t	Campsite
5	Winter tent	\N	t	f	Campsite
6	Cold-weather sleeping bags	\N	t	f	Campsite
7	Insulated sleeping pads	\N	t	f	Campsite
8	Sit pad	\N	t	f	Campsite
9	Headlamps	\N	\N	f	Campsite
10	Camp chairs	\N	\N	f	Campsite
11	Lantern	\N	\N	f	Campsite
12	Sunshade	f	f	t	Campsite
13	Hammock	f	f	t	Campsite
14	Cots	\N	f	t	Campsite
15	Sleeping bag liners	\N	\N	t	Campsite
16	Camp rug	\N	\N	t	Campsite
17	Tablecloth	\N	\N	t	Campsite
18	Clothesline and clips	\N	f	t	Campsite
19	Multi-tool	\N	\N	f	Tools
20	Duct tape	\N	\N	f	Tools
21	Extra cord	\N	\N	f	Tools
22	Tent-pole repair sleeve	\N	\N	f	Tools
23	Pad/mattress repair kit	\N	\N	f	Tools
24	Mallet/hammer	\N	\N	f	Tools
25	Saw/axe	\N	\N	f	Tools
26	Knife	\N	\N	f	Tools
27	Small broom and dustpan	\N	\N	f	Tools
28	Stove and fuel	\N	\N	f	Kitchen
29	Matches/lighters/firestarter	\N	\N	f	Kitchen
30	Cook pots	\N	\N	f	Kitchen
31	Frying pan	\N	\N	f	Kitchen
32	Eating utensils	\N	\N	f	Kitchen
33	Cooking utensils	\N	\N	f	Kitchen
34	Can and bottle opener	\N	\N	f	Kitchen
35	Plates/bowl	\N	\N	f	Kitchen
36	Mugs/cups	\N	\N	f	Kitchen
37	Cutting board	\N	\N	f	Kitchen
38	Cooler	\N	\N	f	Kitchen
39	Ice/ice substitutes	\N	\N	f	Kitchen
40	Water bottles	\N	\N	f	Water
41	Camp sink/wash bins	\N	\N	f	Kitchen
42	Biodegradable soap	\N	\N	f	Kitchen
43	Scrubber/sponge	\N	\N	f	Kitchen
44	Water filter/purifier	\N	\N	f	Water
45	Trash/recycling bags	\N	\N	f	Kitchen
46	Dish towel	\N	\N	f	Kitchen
47	Camp grill and fuel	\N	\N	t	Kitchen
48	Grill rack	\N	\N	t	Kitchen
49	Griddle	\N	\N	t	Kitchen
50	Dutch oven	\N	\N	t	Kitchen
51	Charcoal	\N	\N	t	Kitchen
52	Portable tea/coffee maker	\N	\N	t	Kitchen
53	Rolling ice cream maker	\N	f	t	Kitchen
54	Roasting forks	\N	\N	t	Kitchen
55	Food-storage containers	\N	\N	t	Kitchen
56	Large water jugs	\N	f	t	Water
57	Plastic bins for kitchen gear	\N	\N	t	Kitchen
58	Solar and portable power	\N	\N	t	Extras
59	BiFalseculars	\N	\N	t	Extras
60	Navigation tools	\N	\N	t	Extras
61	Field guides	\N	\N	t	Extras
62	Star chart	\N	\N	t	Extras
63	Reading material	\N	\N	t	Extras
64	Falsetebook and pen/pencil	\N	\N	t	Extras
65	Music player with headphones	\N	\N	t	Extras
66	Games and toys	\N	\N	t	Extras
67	Dog gear	\N	\N	t	Extras
68	Storage bags	\N	\N	t	Extras
69	Moisture-wicking underwear	\N	f	f	Clothing
70	Moisture-wicking long underwear	\N	t	f	Clothing
71	Moisture-wicking T-shirts	\N	f	f	Clothing
72	Quick-drying pants/shorts	\N	f	f	Clothing
73	Long-sleeve shirts	\N	\N	f	Clothing
74	Fleece jacket	\N	t	f	Clothing
75	Lightweight fleece/jacket	\N	f	f	Clothing
76	Terrain boots/shoes	\N	f	f	Clothing
77	Winter boots	f	t	f	Clothing
78	SFalsew shoes	f	t	f	Travel
79	Daypack	\N	\N	f	Travel
80	SFalsew shovel	f	t	f	Travel
81	Gaiters	f	t	f	Clothing
82	Socks (synthetic/wool)	\N	\N	f	Clothing
83	Sleepwear	\N	\N	f	Clothing
84	Rainwear	t	\N	f	Clothing
85	Long underwear	\N	t	f	Clothing
86	Insulated jacket/vest	\N	t	f	Clothing
87	Fleece pants	\N	t	f	Clothing
88	Gloves/mittens	\N	t	f	Clothing
89	Warm hat	\N	t	f	Clothing
90	Swimsuits	\N	f	t	Clothing
91	Water sandals	\N	f	t	Clothing
92	In-camp sandals/booties	\N	f	t	Clothing
93	Bandanas	\N	f	t	Clothing
94	Toilet paper	\N	\N	f	Health/hygiene
95	Hand sanitizer	\N	\N	f	Health/hygiene
96	Toothbrush and toothpaste	\N	\N	f	Health/hygiene
97	Toiletry kit	\N	\N	f	Health/hygiene
98	Quick-dry towel	\N	\N	f	Health/hygiene
99	Menstrual products	\N	\N	f	Health/hygiene
100	Prescription medications	\N	\N	f	Health/hygiene
101	First-aid	\N	\N	f	Health/hygiene
102	Two-way radios	\N	\N	t	Travel
103	Hand and foot warmers	\N	t	t	Travel
104	Sunscreen	f	\N	f	Health/hygiene
105	Sunglasses	f	\N	f	Health/hygiene
106	Sun hat	f	\N	f	Health/hygiene
107	Lip balm	\N	\N	f	Health/hygiene
108	Insect repellent	\N	f	f	Health/hygiene
109	Urinary products	\N	\N	t	Health/hygiene
110	Sanitation trowel (if no toilets)	\N	\N	t	Health/hygiene
111	Baby wipes	\N	\N	t	Health/hygiene
112	Alcohol/antiseptic wipes	\N	\N	t	Health/hygiene
113	Mirror	\N	\N	t	Health/hygiene
114	Brush/comb	\N	\N	t	Health/hygiene
115	Cosmetics	\N	\N	t	Health/hygiene
116	Eyeglasses/contact lens	\N	\N	t	Health/hygiene
117	ETruehades	\N	\N	t	Health/hygiene
118	Earplugs	\N	\N	t	Health/hygiene
119	Portable camp shower	\N	f	t	Health/hygiene
120	Credit card and/or cash	\N	\N	f	Personal
121	ID	\N	\N	f	Personal
122	Cellphone	\N	\N	f	Personal
123	Campsite reservation confirmation	\N	\N	f	Personal
\.


--
-- Data for Name: parks; Type: TABLE DATA; Schema: public; Owner: alishahwee
--

COPY public.parks (id, name, address, coordinates, url) FROM stdin;
1	Afton State Park	6959 Peller Avenue South, Hastings, MN 55033	44.847822,-92.797608	https://www.dnr.state.mn.us/state_parks/afton/index.html
3	Bear Head Lake State Park	9301 Bear Head State Park Road, Ely, MN 55731	47.819641,-92.047706	https://www.dnr.state.mn.us/state_parks/bear_head_lake/index.html
4	Beaver Creek Valley State Park	15954 County 1, Caledonia, MN 55921	43.645962,-91.555023	https://www.dnr.state.mn.us/state_parks/beaver_creek_valley/index.html
5	Big Stone Lake State Park	35889 Meadowbrook State Park Road, Ortonville, MN 56278	45.391608,-96.53036	https://www.dnr.state.mn.us/state_parks/big_stone_lake/index.html
6	Blue Mounds State Park	1410 161st Street, Luverne, MN 56156	43.7177,-96.192638	https://www.dnr.state.mn.us/state_parks/blue_mounds/index.html
7	Buffalo River State Park	565 155th Street South, Glyndon, MN 56547	46.872839,-96.474624	https://www.dnr.state.mn.us/state_parks/buffalo_river/index.html
8	Camden State Park	1897 Camden Park Road, Lynd, MN 56157	44.355699,-95.918122	https://www.dnr.state.mn.us/state_parks/camden/index.html
10	Cascade River State Park	3481 West Highway 61, Lutsen, MN 55612	47.710959,-90.505919	https://www.dnr.state.mn.us/state_parks/cascade_river/index.html
11	Charles A. Lindbergh State Park	1615 Lindbergh Drive South, Little Falls, MN 56345	45.958857,-94.388152	https://www.dnr.state.mn.us/state_parks/charles_a_lindbergh/index.html
12	Crow Wing State Park	3124 State Park Road, Brainerd, MN 56401	46.264153,-94.318974	https://www.dnr.state.mn.us/state_parks/crow_wing/index.html
14	Flandrau State Park	1300 Summit Avenue, New Ulm, MN 56073	44.294231,-94.459411	https://www.dnr.state.mn.us/state_parks/flandrau/index.html
15	Forestville Mystery Cave State Park	21071 County 118, Preston, MN 55965	43.633664,-92.230635	https://www.dnr.state.mn.us/state_parks/forestville_mystery_cave/index.html
16	Fort Ridgely State Park	72158 County Road 30, Fairfax, MN 55332	44.447905,-94.726687	https://www.dnr.state.mn.us/state_parks/fort_ridgely/index.html
17	Fort Snelling State Park	101 Snelling Lake Road, St. Paul, MN 55111	44.871366,-93.195991	https://www.dnr.state.mn.us/state_parks/fort_snelling/index.html
18	Franz Jevne State Park	State Highway 11, Birchdale, MN 56629	48.641689,-94.058496	https://www.dnr.state.mn.us/state_parks/franz_jevne/index.html
19	Frontenac State Park	29223 County 28 Boulevard, Frontenac, MN 55026	44.521833,-92.343275	https://www.dnr.state.mn.us/state_parks/frontenac/index.html
21	Glacial Lakes State Park	25022 County Road 41, Starbuck, MN 56381	45.54167,-95.533468	https://www.dnr.state.mn.us/state_parks/glacial_lakes/index.html
22	Glendalough State Park	24869 Whitetail Lane, Battle Lake, MN 56515	46.311447,-95.67996	https://www.dnr.state.mn.us/state_parks/glendalough/index.html
23	Gooseberry Falls State Park	3206 Highway 61 East, Two Harbors, MN 55616	47.13986,-91.47335	https://www.dnr.state.mn.us/state_parks/gooseberry_falls/index.html
24	Grand Portage State Park	9393 East Highway 61, Grand Portage, MN 55605	47.998931,-89.59363	https://www.dnr.state.mn.us/state_parks/grand_portage/index.html
25	Great River Bluffs State Park	43605 Kipp Drive, Winona, MN 55987	43.937272,-91.429388	https://www.dnr.state.mn.us/state_parks/great_river_bluffs/index.html
26	Hayes Lake State Park	48990 County Road 4, Roseau, MN 56751	48.643872,-95.545248	https://www.dnr.state.mn.us/state_parks/hayes_lake/index.html
29	Itasca State Park	36750 Main Park Drive, Park Rapids, MN 56470	47.250031,-95.212237	https://www.dnr.state.mn.us/state_parks/itasca/index.html
30	Jay Cooke State Park	780 Highway 210, Carlton, MN 55718	46.661595,-92.399082	https://www.dnr.state.mn.us/state_parks/jay_cooke/index.html
32	Judge C. R. Magney State Park	4051 East Highway 61, Grand Marais, MN 55604	47.817415,-90.053747	https://www.dnr.state.mn.us/state_parks/judge_cr_magney/index.html
34	Lac Qui Parle State Park	14047 20th Street Northwest, Watson, MN 56295	45.021109,-95.894069	https://www.dnr.state.mn.us/state_parks/lac_qui_parle/index.html
35	Lake Bemidji State Park	3401 State Park Road Northeast, Bemidji, MN 56601	47.540636,-94.835799	https://www.dnr.state.mn.us/state_parks/lake_bemidji/index.html
36	Lake Bronson State Park	3793 230th St, Box 9	48.731464,-96.634675	https://www.dnr.state.mn.us/state_parks/lake_bronson/index.html
37	Lake Carlos State Park	2601 County Road 38 Northeast, Carlos, MN 56319	46.000442,-95.332947	https://www.dnr.state.mn.us/state_parks/lake_carlos/index.html
39	Lake Maria State Park	11411 Clementa Avenue Northwest, Monticello, MN 55362	45.317411,-93.931667	https://www.dnr.state.mn.us/state_parks/lake_maria/index.html
40	Lake Shetek State Park	163 State Park Road, Currie, MN 56123	44.094789,-95.6808	https://www.dnr.state.mn.us/state_parks/lake_shetek/index.html
42	McCarthy Beach State Park	7622 McCarthy Beach Road, Side Lake, MN 55781	47.6689,-93.031541	https://www.dnr.state.mn.us/state_parks/mccarthy_beach/index.html
43	Maplewood State Park	39721 Park Entrance Road, Pelican Rapids, MN 56572	46.549975,-95.954175	https://www.dnr.state.mn.us/state_parks/maplewood/index.html
2	Banning State Park	61101 Banning Park Rd, Sandstone, MN 55072	46.179636,-92.848759	https://www.dnr.state.mn.us/state_parks/banning/index.html
9	Carley State Park	50366 County Rd 4, Plainview, MN 55964	44.109915,-92.169425	https://www.dnr.state.mn.us/state_parks/carley/index.html
13	Father Hennepin State Park	41296 Father Hennepin Park Rd, Isle, MN 56342	46.138048,-93.480541	https://www.dnr.state.mn.us/state_parks/father_hennepin/index.html
27	Hill-Annex Mine State Park	880 Gary St, Calumet, MN 55716	47.325852,-93.277504	https://www.dnr.state.mn.us/state_parks/hill_annex_mine/index.html
28	Interstate State Park	307 Milltown Rd, Taylors Falls, MN 55084	45.394917,-92.667836	https://www.dnr.state.mn.us/state_parks/interstate/index.html
31	John A. Latsch State Park	US-61, Minnesota City, MN 55959	44.172549,-91.838344	https://www.dnr.state.mn.us/state_parks/john_latsch/index.html
38	Lake Louise State Park	12385 766th Ave, Le Roy, MN 55951	43.535955,-92.509176	https://www.dnr.state.mn.us/state_parks/lake_louise/index.html
33	Kilen Woods State Park	50200 860th Street, Lakefield, MN 56150	43.732178,-95.068799	https://www.dnr.state.mn.us/state_parks/kilen_woods/index.html
20	George H. Crosby Manitou State Park	7616 Co Hwy 7, Finland, MN 55603	47.479452,-91.123011	https://www.dnr.state.mn.us/state_parks/george_crosby_manitou/index.html
44	Mille Lacs Kathio State Park	15066 Kathio State Park Road, Onamia, MN 56359	46.135411,-93.724473	https://www.dnr.state.mn.us/state_parks/mille_lacs_kathio/index.html
45	Minneopa State Park	54497 Gadwall Road, Mankato, MN 56001	44.156337,-94.091356	https://www.dnr.state.mn.us/state_parks/minneopa/index.html
46	Monson Lake State Park	1690 15th Street Northeast, Sunburg, MN 56289	45.318323,-95.275962	https://www.dnr.state.mn.us/state_parks/monson_lake/index.html
47	Moose Lake State Park	4252 County Road 137, Moose Lake, MN 55767	46.436375,-92.735812	https://www.dnr.state.mn.us/state_parks/moose_lake/index.html
48	Myre-Big Island State Park	19499 780th Avenue, Albert Lea, MN 56007	43.640411,-93.308976	https://www.dnr.state.mn.us/state_parks/myre_big_island/index.html
49	Nerstrand Big Woods State Park	9700 170th Street East, Nerstrand, MN 55053	44.341775,-93.091041	https://www.dnr.state.mn.us/state_parks/nerstrand_big_woods/index.html
50	Old Mill State Park	33489 240th Avenue Northwest, Argyle, MN 56713	48.361407,-96.565575	https://www.dnr.state.mn.us/state_parks/old_mill/index.html
51	Rice Lake State Park	8485 Rose Street, Owatonna, MN 55060	44.095564,-93.063508	https://www.dnr.state.mn.us/state_parks/rice_lake/index.html
52	St. Croix State Park	30065 St. Croix Park Road, Hinckley, MN 55037	46.01201,-92.617885	https://www.dnr.state.mn.us/state_parks/st_croix/index.html
53	Sakatah Lake State Park	50499 Sakatah Lake State Park Road, Waterville, MN 56096	44.217841,-93.532328	https://www.dnr.state.mn.us/state_parks/sakatah_lake/index.html
54	Savanna Portage State Park	55626 Lake Place, McGregor, MN 55760	46.757292,-93.249885	https://www.dnr.state.mn.us/state_parks/savanna_portage/index.html
55	Scenic State Park	56956 Scenic Highway 7, Bigfork, MN 56628	47.702943,-93.566799	https://www.dnr.state.mn.us/state_parks/scenic/index.html
57	Sibley State Park	800 Sibley Park Road Northeast, New London, MN 56273	45.311289,-95.009081	https://www.dnr.state.mn.us/state_parks/sibley/index.html
58	Split Rock Creek State Park	336 50th Avenue, Jasper, MN 56144	43.895953,-96.367169	https://www.dnr.state.mn.us/state_parks/split_rock_creek/index.html
59	Split Rock Lighthouse State Park	3755 Split Rock Lighthouse Road, Two Harbors, MN 55616	47.20565,-91.368248	https://www.dnr.state.mn.us/state_parks/split_rock_lighthouse/index.html
61	Tettegouche State Park	5702 Highway 61, Silver Bay, MN 55614	47.339875,-91.196346	https://www.dnr.state.mn.us/state_parks/tettegouche/index.html
62	Upper Sioux Agency State Park	5908 Highway 67, Granite Falls, MN 56241	44.736979,-95.460501	https://www.dnr.state.mn.us/state_parks/upper_sioux_agency/index.html
63	Whitewater State Park	19041 Highway 74, Altura, MN 55910	44.062919,-92.043204	https://www.dnr.state.mn.us/state_parks/whitewater/index.html
64	Wild River State Park	39797 Park Trail, Center City, MN 55012	45.524211,-92.754468	https://www.dnr.state.mn.us/state_parks/wild_river/index.html
65	William O'Brien State Park	16821 O'Brien Trail North, Marine on St. Croix, MN 55047	45.225346,-92.763574	https://www.dnr.state.mn.us/state_parks/william_obrien/index.html
66	Zippel Bay State Park	3684 54th Avenue Northwest, Williams, MN 56686	48.844387,-94.850004	https://www.dnr.state.mn.us/state_parks/zippel_bay/index.html
41	Lake Vermilion-Soudan Underground Mine State Park	1302 McKinley Park Rd, Soudan, MN 55782	47.816696,-92.248857	https://www.dnr.state.mn.us/state_parks/lake_vermilion_soudan/index.html
56	Schoolcraft State Park	9042 Schoolcraft Lane NE, Deer River, MN 56636	47.222814,-93.806591	https://www.dnr.state.mn.us/state_parks/schoolcraft/index.html
60	Temperance River State Park	7620 West, MN-61, Schroeder, MN 55613	47.552663,-90.877469	https://www.dnr.state.mn.us/state_parks/temperance_river/index.html
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: alishahwee
--

COPY public.users (id, username, password, email) FROM stdin;
\.


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alishahwee
--

SELECT pg_catalog.setval('public.activities_id_seq', 360, true);


--
-- Name: blacklist_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alishahwee
--

SELECT pg_catalog.setval('public.blacklist_tokens_id_seq', 1, false);


--
-- Name: checked_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alishahwee
--

SELECT pg_catalog.setval('public.checked_items_id_seq', 1, false);


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alishahwee
--

SELECT pg_catalog.setval('public.favorites_id_seq', 1, false);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alishahwee
--

SELECT pg_catalog.setval('public.images_id_seq', 461, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alishahwee
--

SELECT pg_catalog.setval('public.items_id_seq', 123, true);


--
-- Name: parks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alishahwee
--

SELECT pg_catalog.setval('public.parks_id_seq', 66, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: alishahwee
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: blacklist_tokens blacklist_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.blacklist_tokens
    ADD CONSTRAINT blacklist_tokens_pkey PRIMARY KEY (id);


--
-- Name: blacklist_tokens blacklist_tokens_token_key; Type: CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.blacklist_tokens
    ADD CONSTRAINT blacklist_tokens_token_key UNIQUE (token);


--
-- Name: checked_items checked_items_pkey; Type: CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.checked_items
    ADD CONSTRAINT checked_items_pkey PRIMARY KEY (id);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: items items_name_key; Type: CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_name_key UNIQUE (name);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: parks parks_name_key; Type: CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.parks
    ADD CONSTRAINT parks_name_key UNIQUE (name);


--
-- Name: parks parks_pkey; Type: CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.parks
    ADD CONSTRAINT parks_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: activities activities_park_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_park_id_fkey FOREIGN KEY (park_id) REFERENCES public.parks(id);


--
-- Name: checked_items checked_items_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.checked_items
    ADD CONSTRAINT checked_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: checked_items checked_items_park_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.checked_items
    ADD CONSTRAINT checked_items_park_id_fkey FOREIGN KEY (park_id) REFERENCES public.parks(id);


--
-- Name: checked_items checked_items_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.checked_items
    ADD CONSTRAINT checked_items_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: favorites favorites_park_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_park_id_fkey FOREIGN KEY (park_id) REFERENCES public.parks(id);


--
-- Name: favorites favorites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: images images_park_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: alishahwee
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_park_id_fkey FOREIGN KEY (park_id) REFERENCES public.parks(id);


--
-- PostgreSQL database dump complete
--

