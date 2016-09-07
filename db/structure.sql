--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

--
-- Name: articles_channel; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE articles_channel AS ENUM (
    'advisor',
    'blog'
);


--
-- Name: collections_visibility; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE collections_visibility AS ENUM (
    'public',
    'hidden',
    'private',
    'protected'
);


--
-- Name: resources_visibility; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE resources_visibility AS ENUM (
    'undefined',
    'public',
    'hidden',
    'private',
    'protected'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: articles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE articles (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    blog_post_id integer,
    user_id uuid NOT NULL,
    title character varying,
    body text,
    published_at timestamp without time zone,
    excerpt text,
    featured boolean DEFAULT false NOT NULL,
    ipad_app_featured boolean DEFAULT false NOT NULL,
    ipad_app_position integer,
    categories jsonb,
    app_ids jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    channel articles_channel DEFAULT 'advisor'::articles_channel NOT NULL
);


--
-- Name: assignment_detail_tasks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE assignment_detail_tasks (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    assignment_detail_id uuid NOT NULL,
    user_id uuid,
    kind character varying NOT NULL,
    resource_id uuid,
    data json,
    interaction character varying,
    created_at timestamp without time zone
);


--
-- Name: assignment_details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE assignment_details (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    state character varying,
    assignment_id uuid NOT NULL,
    resource_id uuid NOT NULL,
    user_id uuid,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: assignments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE assignments (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    assignable_id uuid NOT NULL,
    user_id uuid,
    created_at timestamp without time zone,
    assignable_type character varying DEFAULT 'f'::character varying NOT NULL
);


--
-- Name: badge_assertions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE badge_assertions (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    viflearn_assertion_id integer,
    badge_id uuid,
    user_id uuid,
    evidence_url character varying,
    item_id integer,
    school_salesforce_id character varying,
    district_salesforce_id character varying,
    json_file character varying,
    published boolean,
    salesforce_id character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    organization_id uuid,
    imported_data jsonb,
    badge_requirement_id uuid,
    artifact_id uuid
);


--
-- Name: badge_issuers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE badge_issuers (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    viflearn_id integer,
    name character varying,
    url character varying,
    organization character varying,
    email character varying,
    salesforce_id character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: badge_requirements; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE badge_requirements (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    badge_id uuid,
    resource_id uuid,
    interaction_key character varying,
    interaction_kind character varying,
    created_resource_kind character varying
);


--
-- Name: badges; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE badges (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    viflearn_badgeid integer,
    issuer_id uuid,
    salesforce_id character varying,
    name character varying,
    description character varying,
    subheading character varying,
    criteria_url character varying,
    criteria_description character varying,
    hours_equivalency integer,
    tags character varying,
    designtitle character varying,
    unit character varying,
    program character varying,
    grade_level character varying,
    year character varying,
    module character varying,
    module_key character varying,
    badge_type character varying,
    subid character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    image character varying,
    superbadge_id uuid
);


--
-- Name: bookmarks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bookmarks (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    url character varying NOT NULL,
    normalized_url character varying NOT NULL,
    title character varying,
    favicon_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: change_logs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE change_logs (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid,
    change_loggable_id uuid,
    change_loggable_type character varying,
    associated_id uuid,
    associated_type character varying,
    change text,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: chat_invitations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chat_invitations (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid,
    chat_id uuid,
    email citext,
    token character varying,
    accepted_at timestamp without time zone,
    acceptor_id uuid,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chat_messages (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid,
    chat_id uuid,
    twitter_handle character varying,
    tweet_id character varying,
    twitter_id character varying,
    text character varying NOT NULL,
    sent_at timestamp without time zone,
    tweeted_at timestamp without time zone,
    received_at timestamp without time zone,
    twitter_profile_image_url character varying,
    media jsonb,
    tweet jsonb DEFAULT '{}'::jsonb NOT NULL,
    retweeted_chat_message_id uuid,
    flagged_by_id uuid,
    retweet boolean DEFAULT false
);


--
-- Name: chat_occurrence_summaries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chat_occurrence_summaries (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    schedule_occurrence_id uuid,
    transcript_id uuid,
    analytics jsonb DEFAULT '{}'::jsonb,
    moderators jsonb DEFAULT '{}'::jsonb,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: chat_promos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chat_promos (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    key character varying,
    kind character varying,
    time_offset integer DEFAULT 0,
    text character varying,
    image_id uuid,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    disabled_at timestamp without time zone
);


--
-- Name: chat_resources; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chat_resources (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    chat_id uuid NOT NULL,
    chat_message_id uuid NOT NULL,
    resource_id uuid NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    redirect_count integer DEFAULT 0
);


--
-- Name: chats; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chats (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    name citext NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    featured boolean DEFAULT false,
    schedule jsonb,
    description text,
    moderators jsonb DEFAULT '{}'::jsonb,
    spammers jsonb DEFAULT '[]'::jsonb,
    oer boolean DEFAULT false,
    current_qa_session_id uuid,
    promos_enabled boolean DEFAULT false,
    analytics jsonb DEFAULT '{}'::jsonb,
    edcamp boolean DEFAULT false,
    archived_at timestamp without time zone
);


--
-- Name: collaborations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE collaborations (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    collaborator_id uuid,
    collaboratable_id uuid NOT NULL,
    collaboratable_type character varying NOT NULL,
    status character varying,
    email citext,
    token character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    message text
);


--
-- Name: collection_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE collection_groups (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    name character varying NOT NULL,
    collections jsonb DEFAULT '[]'::jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: collection_resources; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE collection_resources (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    collection_id uuid NOT NULL,
    resource_id uuid NOT NULL,
    "position" integer NOT NULL,
    description text
);


--
-- Name: collections; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE collections (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    name character varying NOT NULL,
    description text,
    tags jsonb DEFAULT '[]'::jsonb,
    common_core_tags jsonb DEFAULT '[]'::jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    visibility collections_visibility DEFAULT 'public'::collections_visibility NOT NULL,
    viflearn_k2_category_id integer,
    flags jsonb DEFAULT '{}'::jsonb
);


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comments (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid,
    commentable_id uuid,
    commentable_type character varying,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: content_blocks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE content_blocks (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    resource_id uuid,
    title character varying,
    "position" integer,
    content text,
    kind character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    uploaded_file_id uuid,
    key character varying,
    viflearn_k2_attachment_id integer,
    original_content text,
    flags jsonb DEFAULT '{}'::jsonb
);


--
-- Name: featured_collection_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE featured_collection_groups (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    collection_group_id uuid NOT NULL,
    "position" integer DEFAULT 0 NOT NULL,
    visible boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: imported_data; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE imported_data (
    id integer NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    data jsonb DEFAULT '{}'::jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: imported_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE imported_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: imported_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE imported_data_id_seq OWNED BY imported_data.id;


--
-- Name: key_values; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE key_values (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    key character varying NOT NULL,
    value jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: learning_registry_submissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE learning_registry_submissions (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    resource_id uuid,
    approved boolean,
    reviewed_at timestamp without time zone,
    created_at timestamp without time zone
);


--
-- Name: library_resources; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE library_resources (
    id integer NOT NULL,
    json jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: library_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE library_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: library_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE library_resources_id_seq OWNED BY library_resources.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE notifications (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    key character varying NOT NULL,
    params jsonb DEFAULT '{}'::jsonb NOT NULL,
    acknowledged boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email boolean DEFAULT false,
    realtime boolean DEFAULT false
);


--
-- Name: organization_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organization_users (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    organization_id uuid NOT NULL,
    user_id uuid NOT NULL,
    role character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organizations (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    district_id uuid,
    name character varying,
    salesforce_id character varying,
    type character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    state_id uuid
);


--
-- Name: question_and_answers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE question_and_answers (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    qa_session_id uuid NOT NULL,
    chat_message_id uuid NOT NULL,
    question boolean NOT NULL,
    question_number integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    chat_id uuid NOT NULL
);


--
-- Name: resources; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE resources (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    kind character varying NOT NULL,
    url character varying,
    name character varying,
    image_url character varying,
    published_at timestamp without time zone,
    defunct_at timestamp without time zone,
    tags jsonb DEFAULT '[]'::jsonb,
    common_core_tags jsonb DEFAULT '[]'::jsonb,
    reviews jsonb DEFAULT '[]'::jsonb,
    screenshot_urls jsonb DEFAULT '[]'::jsonb,
    imported_data jsonb DEFAULT '{}'::jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    price character varying,
    lede character varying,
    description text,
    grade_levels jsonb DEFAULT '[]'::jsonb,
    subject_tags jsonb DEFAULT '[]'::jsonb,
    topic_tags jsonb DEFAULT '[]'::jsonb,
    flags jsonb DEFAULT '{}'::jsonb,
    owner character varying,
    user_id uuid,
    visibility resources_visibility DEFAULT 'undefined'::resources_visibility NOT NULL,
    oer boolean DEFAULT false,
    learning_registry jsonb DEFAULT '{}'::jsonb NOT NULL,
    update_queued_at timestamp without time zone,
    learning_registry_id character varying,
    viflearn_k2_item_id integer,
    discussion_prompt character varying
);


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reviews (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid,
    resource_id uuid,
    content_score integer DEFAULT 0 NOT NULL,
    feature_score integer DEFAULT 0 NOT NULL,
    engagement_score integer DEFAULT 0 NOT NULL,
    total_score integer DEFAULT 0 NOT NULL,
    percent_score integer DEFAULT 0 NOT NULL,
    lede character varying,
    comment text,
    published_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    expert boolean DEFAULT false NOT NULL
);


--
-- Name: schedule_occurrences; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schedule_occurrences (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    schedulable_id uuid NOT NULL,
    schedulable_type character varying NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    canceled boolean DEFAULT false
);


--
-- Name: scheduled_messages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE scheduled_messages (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid,
    image_id uuid,
    text character varying,
    job_id character varying,
    scheduled_at timestamp without time zone,
    completed_at timestamp without time zone,
    tweet_id character varying,
    error character varying,
    created_at timestamp without time zone,
    canceled_at timestamp without time zone,
    chat_promo_id uuid,
    schedule_occurrence_id uuid
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: search_configs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE search_configs (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    name character varying,
    config jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE subscriptions (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    subscribable_id uuid NOT NULL,
    subscribable_type character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tag_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tag_groups (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    tags jsonb DEFAULT '[]'::jsonb,
    imported_data jsonb DEFAULT '{}'::jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tags_text text
);


--
-- Name: transcripts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE transcripts (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    begin_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL,
    user_id uuid NOT NULL,
    chat_id uuid NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    collection_id character varying,
    name character varying,
    omitted_message_ids jsonb DEFAULT '[]'::jsonb
);


--
-- Name: uploaded_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE uploaded_files (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    file character varying NOT NULL,
    url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sha256 character varying,
    imported_data jsonb DEFAULT '{}'::jsonb
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    imported_data jsonb DEFAULT '{}'::jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email citext DEFAULT ''::character varying,
    encrypted_password character varying DEFAULT ''::character varying,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    failed_attempts integer DEFAULT 0 NOT NULL,
    locked_at timestamp without time zone,
    name character varying,
    bio text,
    profile_photo_url character varying,
    superuser boolean DEFAULT false,
    google_profile_id character varying,
    external_profile_url_1 character varying,
    external_profile_url_2 character varying,
    visible boolean DEFAULT false,
    twitter_username character varying,
    flags jsonb DEFAULT '{}'::jsonb,
    facebook_id character varying,
    auth_token character varying,
    lede character varying,
    roles jsonb DEFAULT '[]'::jsonb,
    google_id character varying,
    twitter_id character varying,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    auth_tokens jsonb DEFAULT '[]'::jsonb NOT NULL,
    disabled_communication jsonb DEFAULT '[]'::jsonb NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    expertise_tags jsonb DEFAULT '[]'::jsonb,
    grade_levels jsonb DEFAULT '[]'::jsonb,
    merged_users jsonb DEFAULT '[]'::jsonb,
    avatar character varying,
    twitter_auth_token character varying,
    viflearn_user_id integer
);


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE versions (
    id uuid DEFAULT uuid_generate_v4() NOT NULL,
    item_type character varying NOT NULL,
    item_id uuid NOT NULL,
    event character varying NOT NULL,
    whodunnit uuid,
    object jsonb,
    object_changes jsonb,
    approved_by uuid,
    approved_at timestamp without time zone,
    created_at timestamp without time zone
);


--
-- Name: viflearn_all_districts_directory; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_all_districts_directory (
    district_id character varying(255) NOT NULL,
    district_name character varying(255),
    physical_city character varying(255),
    mailing_city character varying(255),
    physical_state_province character varying(255),
    mailing_state_province character varying(255),
    "passport _cohort" bytea,
    passport_single_team bytea,
    passport_whole_school bytea,
    splash_mandarin bytea,
    splash_spanish bytea,
    cet bytea
);


--
-- Name: viflearn_all_school_district_map; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_all_school_district_map (
    school_id character varying(255) NOT NULL,
    school_name character varying(255),
    district_id character varying(255),
    district_name character varying(255)
);


--
-- Name: viflearn_all_schools_directory; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_all_schools_directory (
    school_id character varying(255) NOT NULL,
    school_name character varying(255),
    city character varying(255),
    state character varying(255),
    passport_cohort bytea,
    passport_single_team bytea,
    passport_whole_school bytea,
    splash_mandarin bytea,
    splash_spanish bytea,
    cet bytea
);


--
-- Name: viflearn_badge_assertions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_badge_assertions (
    assertion_id integer NOT NULL,
    badge_id integer,
    recipient integer,
    badge_url character varying(81),
    verify character varying(50),
    "issuedOn" timestamp without time zone,
    image character varying(104),
    evidence character varying(87),
    expires integer,
    badge_type character varying(50),
    item_id integer,
    "schoolID" character varying(45),
    "districtID" character varying(45),
    json_file character varying(255),
    published smallint,
    sf_ext_id character varying(255),
    sf_staff_record_id character varying(255),
    concatenate_badgeid_userid character varying(45),
    school_year character varying(45)
);


--
-- Name: viflearn_badge_class; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_badge_class (
    id integer NOT NULL,
    badgeid integer,
    name character varying(113),
    description character varying(518),
    subheading character varying(87),
    image character varying(109),
    criteria character varying(97),
    criteria_description character varying(830),
    hours_equivalency integer,
    issuer character varying(50),
    alignment character varying(50),
    tags character varying(92),
    designtitle character varying(52),
    unit character varying(93),
    ext_id character varying(50),
    program character varying(58),
    grade_level character varying(50),
    year character varying(50),
    module character varying(50),
    module_key character varying(51),
    badge_type character varying(50),
    subid character varying(50),
    state character varying(50),
    ordering character varying(50),
    created_by character varying(50),
    checked_out character varying(50),
    checked_out_time character varying(50)
);


--
-- Name: viflearn_badge_issuer; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_badge_issuer (
    id integer NOT NULL,
    issuer_name character varying(100),
    issuer_url character varying(200),
    issuer_organization character varying(100),
    issuer_contact character varying(100),
    sf_issuer_id character varying(45)
);


--
-- Name: viflearn_community_activities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_community_activities (
    id bigint NOT NULL,
    actor bigint,
    target bigint,
    title text,
    content text,
    app character varying(200),
    verb character varying(200),
    cid integer,
    groupid integer,
    eventid integer,
    group_access smallint,
    event_access smallint,
    created timestamp without time zone,
    access smallint,
    params text,
    points integer,
    archived smallint,
    location text,
    latitude double precision,
    longitude double precision,
    comment_id integer,
    comment_type character varying(200),
    like_id integer,
    like_type character varying(200),
    actors text,
    updated_at timestamp without time zone
);


--
-- Name: viflearn_community_events; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_community_events (
    id bigint NOT NULL,
    parent integer,
    catid bigint,
    contentid bigint,
    type character varying(255),
    title character varying(255),
    location text,
    summary text,
    description text,
    creator bigint,
    startdate timestamp without time zone,
    enddate timestamp without time zone,
    permission smallint,
    avatar character varying(255),
    thumb character varying(255),
    cover text,
    invitedcount bigint,
    confirmedcount bigint,
    declinedcount bigint,
    maybecount bigint,
    wallcount bigint,
    ticket bigint,
    allowinvite smallint,
    created timestamp without time zone,
    hits bigint,
    published bigint,
    latitude double precision,
    longitude double precision,
    "offset" character varying(5),
    allday smallint,
    repeat character varying(50),
    repeatend date,
    params text,
    storage character varying(64),
    unlisted smallint
);


--
-- Name: viflearn_community_events_category; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_community_events_category (
    id bigint NOT NULL,
    parent integer,
    name character varying(255),
    description text
);


--
-- Name: viflearn_community_featured; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_community_featured (
    id integer NOT NULL,
    cid integer,
    created_by integer,
    target_id integer,
    type character varying(255),
    created timestamp without time zone
);


--
-- Name: viflearn_community_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_community_groups (
    id integer NOT NULL,
    published smallint,
    ownerid integer,
    categoryid integer,
    name character varying(255),
    description text,
    email character varying(255),
    website character varying(255),
    approvals smallint,
    created timestamp without time zone,
    avatar text,
    thumb text,
    cover text,
    discusscount integer,
    wallcount integer,
    membercount integer,
    params text,
    storage character varying(64),
    hits integer,
    summary text,
    unlisted smallint
);


--
-- Name: viflearn_community_groups_category; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_community_groups_category (
    id integer NOT NULL,
    parent integer,
    name character varying(255),
    description text
);


--
-- Name: viflearn_community_groups_discuss; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_community_groups_discuss (
    id integer NOT NULL,
    parentid integer,
    groupid integer,
    creator integer,
    created timestamp without time zone,
    title text,
    message character varying(764),
    lastreplied timestamp without time zone,
    lock smallint,
    params text
);


--
-- Name: viflearn_community_groups_members; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_community_groups_members (
    groupid integer,
    memberid integer,
    approved integer,
    permissions integer
);


--
-- Name: viflearn_community_photos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_community_photos (
    id integer NOT NULL,
    albumid integer,
    caption text,
    published smallint,
    creator integer,
    permissions character varying(255),
    image character varying(255),
    thumbnail character varying(255),
    original character varying(255),
    filesize integer,
    storage character varying(64),
    created timestamp without time zone,
    ordering integer,
    hits integer,
    status character varying(200),
    params text
);


--
-- Name: viflearn_community_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_community_users (
    userid integer NOT NULL,
    status text,
    status_access integer,
    points integer,
    posted_on timestamp without time zone,
    avatar text,
    thumb text,
    cover text,
    invite integer,
    params text,
    view integer,
    friends text,
    groups text,
    events text,
    friendcount integer,
    alias character varying(255),
    latitude double precision,
    longitude double precision,
    profile_id integer,
    storage character varying(64),
    watermark_hash character varying(255),
    search_email smallint
);


--
-- Name: viflearn_community_videos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_community_videos (
    id bigint NOT NULL,
    title character varying(200),
    type character varying(200),
    video_id character varying(200),
    description text,
    creator bigint,
    creator_type character varying(200),
    created timestamp without time zone,
    permissions character varying(255),
    category_id bigint,
    hits bigint,
    published smallint,
    featured smallint,
    duration numeric,
    status character varying(200),
    thumb character varying(255),
    path character varying(255),
    groupid bigint,
    eventid integer,
    filesize integer,
    storage character varying(64),
    location text,
    latitude double precision,
    longitude double precision,
    params text
);


--
-- Name: viflearn_community_videos_category; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_community_videos_category (
    id integer NOT NULL,
    parent integer,
    name character varying(255),
    description text,
    published smallint
);


--
-- Name: viflearn_community_wall; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_community_wall (
    id bigint NOT NULL,
    contentid bigint,
    post_by bigint,
    ip character varying(45),
    comment text,
    date character varying(45),
    published smallint,
    type character varying(200),
    params text
);


--
-- Name: viflearn_content; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_content (
    id bigint NOT NULL,
    asset_id bigint,
    title character varying(255),
    alias character varying(255),
    introtext text,
    fulltext text,
    state smallint,
    catid bigint,
    created timestamp without time zone,
    created_by bigint,
    created_by_alias character varying(255),
    modified timestamp without time zone,
    modified_by bigint,
    checked_out bigint,
    checked_out_time timestamp without time zone,
    publish_up timestamp without time zone,
    publish_down timestamp without time zone,
    images text,
    urls text,
    attribs character varying(5120),
    version bigint,
    ordering integer,
    metakey text,
    metadesc text,
    access bigint,
    hits bigint,
    metadata text,
    featured smallint,
    language character(7),
    xreference character varying(50)
);


--
-- Name: viflearn_content_frontpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_content_frontpage (
    content_id integer NOT NULL,
    ordering integer
);


--
-- Name: viflearn_contentitem_tag_map; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_contentitem_tag_map (
    type_alias character varying(255),
    core_content_id bigint,
    content_item_id integer,
    tag_id bigint,
    tag_date timestamp without time zone,
    type_id integer
);


--
-- Name: viflearn_discuss_category; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_discuss_category (
    id bigint NOT NULL,
    created_by integer,
    title character varying(255),
    description text,
    alias character varying(255),
    created timestamp without time zone,
    status smallint,
    published smallint,
    ordering smallint,
    avatar character varying(255),
    parent_id integer,
    private bigint,
    "default" smallint,
    level integer,
    lft integer,
    rgt integer,
    params text,
    container smallint
);


--
-- Name: viflearn_discuss_posts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_discuss_posts (
    id bigint NOT NULL,
    title text,
    alias text,
    created timestamp without time zone,
    modified timestamp without time zone,
    replied timestamp without time zone,
    content text,
    published smallint,
    ordering smallint,
    vote bigint,
    hits bigint,
    islock smallint,
    lockdate timestamp without time zone,
    featured smallint,
    isresolve smallint,
    isreport smallint,
    answered smallint,
    user_id bigint,
    parent_id bigint,
    user_type character varying(255),
    poster_name character varying(255),
    poster_email character varying(255),
    num_likes integer,
    num_negvote integer,
    sum_totalvote integer,
    category_id bigint,
    params text,
    password text,
    legacy smallint,
    address text,
    latitude character varying(255),
    longitude character varying(255),
    content_type character varying(25),
    post_status smallint,
    post_type character varying(255),
    ip character varying(255),
    private smallint
);


--
-- Name: viflearn_easyblog_post; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_easyblog_post (
    id bigint NOT NULL,
    created_by bigint,
    created timestamp without time zone,
    modified timestamp without time zone,
    title text,
    permalink text,
    content text,
    intro text,
    excerpt text,
    category_id bigint,
    published smallint,
    publish_up timestamp without time zone,
    publish_down timestamp without time zone,
    ordering smallint,
    vote bigint,
    hits bigint,
    private bigint,
    allowcomment smallint,
    subscription smallint,
    frontpage smallint,
    isnew smallint,
    ispending smallint,
    issitewide smallint,
    blogpassword character varying(100),
    latitude character varying(255),
    longitude character varying(255),
    address text,
    system smallint,
    source character varying(255),
    robots text,
    copyrights text,
    image text,
    language character(7),
    send_notification_emails smallint
);


--
-- Name: viflearn_k2_attachments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_k2_attachments (
    id integer NOT NULL,
    "itemID" integer,
    filename character varying(255),
    title character varying(255),
    "titleAttribute" text,
    thumbnail character varying(255),
    hits integer,
    catid character varying(55),
    userid integer,
    datetime timestamp without time zone,
    uploadtype character varying(45)
);


--
-- Name: viflearn_k2_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_k2_categories (
    id bigint NOT NULL,
    name character varying(255),
    alias character varying(255),
    description text,
    parent integer,
    "extraFieldsGroup" integer,
    published integer,
    access integer,
    ordering integer,
    image character varying(255),
    params text,
    trash integer,
    plugins text,
    language character(7)
);


--
-- Name: viflearn_k2_comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_k2_comments (
    id integer NOT NULL,
    "itemID" integer,
    "userID" integer,
    "userName" character varying(255),
    "commentDate" timestamp without time zone,
    "commentText" text,
    "commentEmail" character varying(255),
    "commentURL" character varying(255),
    published integer
);


--
-- Name: viflearn_k2_extra_fields; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_k2_extra_fields (
    id integer NOT NULL,
    name character varying(255),
    value text,
    type character varying(255),
    "group" integer,
    published smallint,
    ordering integer
);


--
-- Name: viflearn_k2_extra_fields_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_k2_extra_fields_groups (
    id integer NOT NULL,
    name character varying(255)
);


--
-- Name: viflearn_k2_extra_fields_index; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_k2_extra_fields_index (
    id integer NOT NULL,
    k2_item_id integer,
    item_title character varying(255),
    user_id integer,
    catid integer,
    description text,
    extrafield_keyword text,
    extrafield_gradelevel character varying(255),
    extrafield_region character varying(255),
    extrafield_subject character varying(255),
    extrafield_author character varying(55),
    extrafield_language character varying(55),
    extrafield_resourcetype character varying(55),
    extrafield_globaltopic character varying(255),
    extrafield_length character varying(255),
    extrafield_materials text,
    extrafield_ask text,
    extrafield_activate text,
    extrafield_investigate text,
    extrafield_synthesize text,
    extrafield_share text,
    extrafield_reflect text,
    extrafield_assess text,
    extrafield_extend text,
    extrafield_web_print text,
    extrafield_standards text,
    extrafield_reflection text,
    extrafield_school character varying(255),
    extrafield_district character varying(255),
    extrafield_connection character varying(25),
    extrafield_moduleid character varying(25),
    extrafield_revision_status character varying(25),
    extrafield_tags text,
    date_created timestamp without time zone,
    date_edited timestamp without time zone,
    date_revised timestamp without time zone,
    published integer,
    access integer,
    extrafield_unit character varying(45),
    extrafield_unit_lesson_plans character varying(45),
    extrafield_activities character varying(45),
    extrafield_competence character varying(45),
    extrafield_capstone character varying(45),
    extrafield_attachments character varying(45)
);


--
-- Name: viflearn_k2_extra_fields_mapping; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_k2_extra_fields_mapping (
    map_id integer NOT NULL,
    extra_field_id integer,
    extra_field_name text,
    group_type text,
    extra_field_option1 text,
    extra_field_option2 text,
    extra_field_option3 text,
    extra_field_option4 text,
    extra_field_option5 text,
    extra_field_option6 text,
    extra_field_option7 text,
    extra_field_option8 text,
    extra_field_option9 text,
    extra_field_option10 text,
    extra_field_option11 text,
    extra_field_option12 text,
    extra_field_option13 text,
    extra_field_option14 text,
    extra_field_option15 text,
    extra_field_option16 text,
    extra_field_option17 text,
    extra_field_option18 text,
    extra_field_option19 text,
    extra_field_option20 text
);


--
-- Name: viflearn_k2_itemid_associations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_k2_itemid_associations (
    id integer NOT NULL,
    k2itemid integer,
    badgeid integer,
    userid integer,
    catid integer,
    status character(20),
    formurl text,
    date_created timestamp without time zone,
    date_edited timestamp without time zone,
    date_attached timestamp without time zone,
    date_revised timestamp without time zone,
    user_school character varying(255),
    user_district character varying(255),
    badge_assertion_id integer,
    sf_ext_id character varying(45),
    last_modified timestamp without time zone,
    concat_badgeid_userid character varying(45)
);


--
-- Name: viflearn_k2_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_k2_items (
    id integer NOT NULL,
    title character varying(255),
    alias character varying(87),
    created_by integer,
    moduletype character varying(50),
    catid integer,
    published integer,
    introtext text,
    fulltext text,
    video character varying(50),
    gallery character varying(50),
    extra_fields text,
    extra_fields_search text,
    created timestamp without time zone,
    created_by_alias character varying(50),
    checked_out integer,
    checked_out_time timestamp without time zone,
    modified timestamp without time zone,
    modified_by character varying(50),
    publish_up timestamp without time zone,
    publish_down timestamp without time zone,
    trash integer,
    access integer,
    ordering integer,
    featured character varying(50),
    featured_ordering character varying(50),
    image_caption character varying(50),
    image_credits character varying(50),
    video_caption character varying(50),
    video_credits character varying(50),
    hits integer,
    params character varying(255),
    metadesc character varying(238),
    metadata character varying(50),
    metakey character varying(50),
    plugins character varying(50),
    language character varying(50),
    badge integer,
    userid_catid character varying(45),
    rating_sum integer,
    rating_count integer,
    vif_other integer,
    title_catid_concat integer,
    image_filename character varying(45)
);


--
-- Name: viflearn_k2_matching_custom_table; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_k2_matching_custom_table (
    module_id integer NOT NULL,
    subid character varying(50),
    catid integer,
    badgeid integer,
    yearbadgeid integer,
    pd_module character varying(255),
    ref_catid integer,
    lp_formid integer,
    attach_formid integer,
    reflection_formid integer,
    module_key character varying(50),
    lp_form_menu character varying(64),
    lp_reflection_menu character varying(51),
    lp_attachments_menu character varying(57),
    year character varying(50),
    badgeurl character varying(255),
    badgetype character varying(50),
    additional_criteria_catid integer,
    conf_page character varying(255),
    module_name character varying(255),
    badge_image character varying(255),
    form_type character varying(45),
    create_conf_page character varying(255),
    share_conf_page character varying(255),
    revise_conf_page character varying(255)
);


--
-- Name: viflearn_k2_rating; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_k2_rating (
    "itemID" integer NOT NULL,
    rating_sum bigint,
    rating_count bigint,
    lastip character varying(50)
);


--
-- Name: viflearn_k2_search_tally; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_k2_search_tally (
    search_id integer NOT NULL,
    k2_item_id integer,
    add_status text,
    datetime_updated timestamp without time zone
);


--
-- Name: viflearn_k2_tags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_k2_tags (
    id integer NOT NULL,
    name character varying(255),
    published integer
);


--
-- Name: viflearn_k2_tags_xref; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_k2_tags_xref (
    id integer NOT NULL,
    "tagID" integer,
    "itemID" integer
);


--
-- Name: viflearn_listbingo_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_listbingo_categories (
    id bigint NOT NULL,
    title character varying(255),
    alias character varying(255),
    logo character varying(255),
    description text,
    parent_id integer,
    profile character varying(255),
    hasprice smallint,
    priceable smallint,
    price numeric(15,5),
    currency character varying(16),
    currency_symbol character varying(8),
    access smallint,
    ordering integer,
    published smallint,
    level integer,
    rel_cats text,
    cats_path text,
    last_cat smallint,
    checked_out bigint,
    checked_out_time timestamp without time zone
);


--
-- Name: viflearn_listbingo_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_listbingo_items (
    id integer NOT NULL,
    global_id character varying(255),
    title character varying(255),
    alias character varying(255),
    currency character varying(255),
    currencycode character varying(10),
    pricetype smallint,
    price numeric(15,5),
    access smallint,
    prestatus integer,
    status smallint,
    description text,
    category_id integer,
    country_code character varying(8),
    region_id integer,
    user_id integer,
    type_id integer,
    condition_id integer,
    zipcode character varying(20),
    address1 text,
    address2 character varying(255),
    created_date timestamp without time zone,
    expiry_date timestamp without time zone,
    modified_date timestamp without time zone,
    show_contact smallint,
    views integer,
    itemtags text,
    ordering integer,
    featured smallint,
    badge_priority integer,
    badge_id integer,
    badge_start_date timestamp without time zone,
    badge_valid_days integer,
    image character varying(255),
    extrafield_values text,
    lat numeric(10,7),
    lng numeric(10,7),
    pagetitle text,
    metakey text,
    metadesc text,
    enable_map smallint,
    expired smallint,
    priceable_category integer,
    checked_out bigint,
    checked_out_time timestamp without time zone,
    paid_rel_cats character varying(255),
    salt character varying(255),
    authkey character varying(255),
    rel_cats character varying(255)
);


--
-- Name: viflearn_listbingo_itemsimages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_listbingo_itemsimages (
    id integer,
    caption character varying(255),
    item_id integer,
    "primary" smallint,
    published smallint,
    ordering integer,
    image character varying(255)
);


--
-- Name: viflearn_listbingo_pms_threads; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_listbingo_pms_threads (
    id bigint,
    item_id integer,
    message text,
    posted_date timestamp without time zone,
    name character varying(255),
    email character varying(255),
    users character varying(255),
    read integer,
    unread integer,
    ordering integer,
    to_read smallint,
    from_read smallint,
    guest smallint,
    sent_delete smallint,
    inbox_delete smallint
);


--
-- Name: viflearn_listbingo_pms_threads_messages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_listbingo_pms_threads_messages (
    id bigint,
    thread_id integer,
    uid integer,
    message text,
    sent_delete integer,
    inbox_delete integer,
    posted_date timestamp without time zone
);


--
-- Name: viflearn_menu; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_menu (
    id integer NOT NULL,
    menutype character varying(24),
    title character varying(255),
    alias character varying(255),
    note character varying(255),
    path character varying(1024),
    link character varying(1024),
    type character varying(16),
    published smallint,
    parent_id bigint,
    level bigint,
    component_id bigint,
    checked_out bigint,
    checked_out_time timestamp without time zone,
    "browserNav" smallint,
    access bigint,
    img character varying(255),
    template_style_id bigint,
    params text,
    lft integer,
    rgt integer,
    home smallint,
    language character(7),
    client_id smallint,
    k2_match integer
);


--
-- Name: viflearn_menu_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_menu_types (
    id bigint NOT NULL,
    menutype character varying(24),
    title character varying(48),
    description character varying(255)
);


--
-- Name: viflearn_modules; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_modules (
    id integer NOT NULL,
    asset_id bigint,
    title character varying(100),
    note character varying(255),
    content text,
    ordering integer,
    "position" character varying(50),
    checked_out bigint,
    checked_out_time timestamp without time zone,
    publish_up timestamp without time zone,
    publish_down timestamp without time zone,
    published smallint,
    module character varying(50),
    access bigint,
    showtitle smallint,
    params text,
    client_id smallint,
    language character(7),
    extra_params character varying(5120)
);


--
-- Name: viflearn_modules_menu; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_modules_menu (
    moduleid integer NOT NULL,
    menuid integer NOT NULL
);


--
-- Name: viflearn_spmedia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_spmedia (
    id bigint NOT NULL,
    title character varying(255),
    path character varying(255),
    thumb character varying(255),
    alt character varying(255),
    caption character varying(2048),
    description text,
    type character varying(100),
    extension character varying(100),
    created_on timestamp without time zone,
    created_by bigint,
    modified_on timestamp without time zone,
    modified_by bigint
);


--
-- Name: viflearn_sppagebuilder; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_sppagebuilder (
    id bigint NOT NULL,
    title character varying(255),
    alias character varying(255),
    text text,
    published smallint,
    catid integer,
    access integer,
    ordering integer,
    created_time timestamp without time zone,
    created_user_id bigint,
    modified_time timestamp without time zone,
    modified_user_id bigint,
    og_title character varying(255),
    og_image character varying(255),
    og_description character varying(255),
    page_layout character varying(55),
    language character(7),
    hits bigint
);


--
-- Name: viflearn_tags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_tags (
    id bigint NOT NULL,
    parent_id bigint,
    lft integer,
    rgt integer,
    level bigint,
    path character varying(255),
    title character varying(255),
    alias character varying(255),
    note character varying(255),
    description text,
    published smallint,
    checked_out bigint,
    checked_out_time timestamp without time zone,
    access bigint,
    params text,
    metadesc character varying(1024),
    metakey character varying(1024),
    metadata character varying(2048),
    created_user_id bigint,
    created_time timestamp without time zone,
    created_by_alias character varying(255),
    modified_user_id bigint,
    modified_time timestamp without time zone,
    images text,
    urls text,
    hits bigint,
    language character(7),
    version bigint,
    publish_up timestamp without time zone,
    publish_down timestamp without time zone
);


--
-- Name: viflearn_user_usergroup_map; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_user_usergroup_map (
    user_id bigint NOT NULL,
    group_id bigint NOT NULL,
    concat_usergroup character varying(45),
    date_updated timestamp without time zone
);


--
-- Name: viflearn_user_usergroupid_match_planid; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_user_usergroupid_match_planid (
    id integer NOT NULL,
    plan_id integer,
    title character varying(80),
    modulekey character varying(50),
    usergroupid character varying(50),
    usergroupname character varying(70),
    succeeding_groupid character varying(50)
);


--
-- Name: viflearn_usergroups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_usergroups (
    id bigint NOT NULL,
    parent_id bigint,
    lft integer,
    rgt integer,
    title character varying(100)
);


--
-- Name: viflearn_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_users (
    id integer NOT NULL,
    name character varying(255),
    username character varying(150),
    email character varying(100),
    password character varying(100),
    block smallint,
    "sendEmail" smallint,
    "registerDate" timestamp without time zone,
    "lastvisitDate" timestamp without time zone,
    activation character varying(100),
    params text,
    "lastResetTime" timestamp without time zone,
    "resetCount" integer,
    "requireReset" smallint,
    "otpKey" character varying(1000),
    otep character varying(1000),
    contactrecordtype character varying(20),
    "salesforceID" character varying(20),
    "accountID" character varying(20),
    "schoolID" character varying(45),
    "districtID" character varying(45),
    lc_user_status character varying(45),
    cohort character varying(45),
    cohort_start_year character varying(45),
    j1_term character varying(45),
    j1_placed_subject character varying(255),
    j1_staff_record character varying(255),
    j1_subtype character varying(255),
    secondary_email character varying(100),
    title character varying(255),
    grade character varying(255),
    subject character varying(255),
    lti_role character varying(45)
);


--
-- Name: viflearn_viewlevels; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE viflearn_viewlevels (
    id bigint NOT NULL,
    title character varying(100),
    ordering integer,
    rules character varying(5120)
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY imported_data ALTER COLUMN id SET DEFAULT nextval('imported_data_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY library_resources ALTER COLUMN id SET DEFAULT nextval('library_resources_id_seq'::regclass);


--
-- Name: articles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: assignment_detail_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY assignment_detail_tasks
    ADD CONSTRAINT assignment_detail_tasks_pkey PRIMARY KEY (id);


--
-- Name: assignment_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY assignment_details
    ADD CONSTRAINT assignment_details_pkey PRIMARY KEY (id);


--
-- Name: assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- Name: badge_assertions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY badge_assertions
    ADD CONSTRAINT badge_assertions_pkey PRIMARY KEY (id);


--
-- Name: badge_issuers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY badge_issuers
    ADD CONSTRAINT badge_issuers_pkey PRIMARY KEY (id);


--
-- Name: badge_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY badge_requirements
    ADD CONSTRAINT badge_requirements_pkey PRIMARY KEY (id);


--
-- Name: badges_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY badges
    ADD CONSTRAINT badges_pkey PRIMARY KEY (id);


--
-- Name: bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bookmarks
    ADD CONSTRAINT bookmarks_pkey PRIMARY KEY (id);


--
-- Name: change_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY change_logs
    ADD CONSTRAINT change_logs_pkey PRIMARY KEY (id);


--
-- Name: chat_invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chat_invitations
    ADD CONSTRAINT chat_invitations_pkey PRIMARY KEY (id);


--
-- Name: chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chat_messages
    ADD CONSTRAINT chat_messages_pkey PRIMARY KEY (id);


--
-- Name: chat_occurrence_summaries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chat_occurrence_summaries
    ADD CONSTRAINT chat_occurrence_summaries_pkey PRIMARY KEY (id);


--
-- Name: chat_promos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chat_promos
    ADD CONSTRAINT chat_promos_pkey PRIMARY KEY (id);


--
-- Name: chat_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chat_resources
    ADD CONSTRAINT chat_resources_pkey PRIMARY KEY (id);


--
-- Name: chats_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chats
    ADD CONSTRAINT chats_pkey PRIMARY KEY (id);


--
-- Name: collaborations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY collaborations
    ADD CONSTRAINT collaborations_pkey PRIMARY KEY (id);


--
-- Name: collection_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY collection_groups
    ADD CONSTRAINT collection_groups_pkey PRIMARY KEY (id);


--
-- Name: collection_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY collection_resources
    ADD CONSTRAINT collection_resources_pkey PRIMARY KEY (id);


--
-- Name: collections_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: content_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY content_blocks
    ADD CONSTRAINT content_blocks_pkey PRIMARY KEY (id);


--
-- Name: featured_collection_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY featured_collection_groups
    ADD CONSTRAINT featured_collection_groups_pkey PRIMARY KEY (id);


--
-- Name: imported_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY imported_data
    ADD CONSTRAINT imported_data_pkey PRIMARY KEY (id);


--
-- Name: key_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY key_values
    ADD CONSTRAINT key_values_pkey PRIMARY KEY (id);


--
-- Name: learning_registry_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY learning_registry_submissions
    ADD CONSTRAINT learning_registry_submissions_pkey PRIMARY KEY (id);


--
-- Name: library_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY library_resources
    ADD CONSTRAINT library_resources_pkey PRIMARY KEY (id);


--
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: organization_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organization_users
    ADD CONSTRAINT organization_users_pkey PRIMARY KEY (id);


--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: question_and_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY question_and_answers
    ADD CONSTRAINT question_and_answers_pkey PRIMARY KEY (id);


--
-- Name: resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: schedule_occurrences_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY schedule_occurrences
    ADD CONSTRAINT schedule_occurrences_pkey PRIMARY KEY (id);


--
-- Name: scheduled_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY scheduled_messages
    ADD CONSTRAINT scheduled_messages_pkey PRIMARY KEY (id);


--
-- Name: search_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY search_configs
    ADD CONSTRAINT search_configs_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: tag_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tag_groups
    ADD CONSTRAINT tag_groups_pkey PRIMARY KEY (id);


--
-- Name: transcripts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transcripts
    ADD CONSTRAINT transcripts_pkey PRIMARY KEY (id);


--
-- Name: uploaded_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY uploaded_files
    ADD CONSTRAINT uploaded_files_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: viflearn_all_districts_directory_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_all_districts_directory
    ADD CONSTRAINT viflearn_all_districts_directory_pkey PRIMARY KEY (district_id);


--
-- Name: viflearn_all_school_district_map_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_all_school_district_map
    ADD CONSTRAINT viflearn_all_school_district_map_pkey PRIMARY KEY (school_id);


--
-- Name: viflearn_all_schools_directory_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_all_schools_directory
    ADD CONSTRAINT viflearn_all_schools_directory_pkey PRIMARY KEY (school_id);


--
-- Name: viflearn_badge_assertions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_badge_assertions
    ADD CONSTRAINT viflearn_badge_assertions_pkey PRIMARY KEY (assertion_id);


--
-- Name: viflearn_badge_class_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_badge_class
    ADD CONSTRAINT viflearn_badge_class_pkey PRIMARY KEY (id);


--
-- Name: viflearn_badge_issuer_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_badge_issuer
    ADD CONSTRAINT viflearn_badge_issuer_pkey PRIMARY KEY (id);


--
-- Name: viflearn_community_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_community_activities
    ADD CONSTRAINT viflearn_community_activities_pkey PRIMARY KEY (id);


--
-- Name: viflearn_community_events_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_community_events_category
    ADD CONSTRAINT viflearn_community_events_category_pkey PRIMARY KEY (id);


--
-- Name: viflearn_community_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_community_events
    ADD CONSTRAINT viflearn_community_events_pkey PRIMARY KEY (id);


--
-- Name: viflearn_community_featured_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_community_featured
    ADD CONSTRAINT viflearn_community_featured_pkey PRIMARY KEY (id);


--
-- Name: viflearn_community_groups_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_community_groups_category
    ADD CONSTRAINT viflearn_community_groups_category_pkey PRIMARY KEY (id);


--
-- Name: viflearn_community_groups_discuss_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_community_groups_discuss
    ADD CONSTRAINT viflearn_community_groups_discuss_pkey PRIMARY KEY (id);


--
-- Name: viflearn_community_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_community_groups
    ADD CONSTRAINT viflearn_community_groups_pkey PRIMARY KEY (id);


--
-- Name: viflearn_community_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_community_photos
    ADD CONSTRAINT viflearn_community_photos_pkey PRIMARY KEY (id);


--
-- Name: viflearn_community_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_community_users
    ADD CONSTRAINT viflearn_community_users_pkey PRIMARY KEY (userid);


--
-- Name: viflearn_community_videos_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_community_videos_category
    ADD CONSTRAINT viflearn_community_videos_category_pkey PRIMARY KEY (id);


--
-- Name: viflearn_community_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_community_videos
    ADD CONSTRAINT viflearn_community_videos_pkey PRIMARY KEY (id);


--
-- Name: viflearn_community_wall_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_community_wall
    ADD CONSTRAINT viflearn_community_wall_pkey PRIMARY KEY (id);


--
-- Name: viflearn_content_frontpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_content_frontpage
    ADD CONSTRAINT viflearn_content_frontpage_pkey PRIMARY KEY (content_id);


--
-- Name: viflearn_content_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_content
    ADD CONSTRAINT viflearn_content_pkey PRIMARY KEY (id);


--
-- Name: viflearn_discuss_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_discuss_category
    ADD CONSTRAINT viflearn_discuss_category_pkey PRIMARY KEY (id);


--
-- Name: viflearn_discuss_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_discuss_posts
    ADD CONSTRAINT viflearn_discuss_posts_pkey PRIMARY KEY (id);


--
-- Name: viflearn_easyblog_post_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_easyblog_post
    ADD CONSTRAINT viflearn_easyblog_post_pkey PRIMARY KEY (id);


--
-- Name: viflearn_k2_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_k2_attachments
    ADD CONSTRAINT viflearn_k2_attachments_pkey PRIMARY KEY (id);


--
-- Name: viflearn_k2_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_k2_categories
    ADD CONSTRAINT viflearn_k2_categories_pkey PRIMARY KEY (id);


--
-- Name: viflearn_k2_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_k2_comments
    ADD CONSTRAINT viflearn_k2_comments_pkey PRIMARY KEY (id);


--
-- Name: viflearn_k2_extra_fields_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_k2_extra_fields_groups
    ADD CONSTRAINT viflearn_k2_extra_fields_groups_pkey PRIMARY KEY (id);


--
-- Name: viflearn_k2_extra_fields_index_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_k2_extra_fields_index
    ADD CONSTRAINT viflearn_k2_extra_fields_index_pkey PRIMARY KEY (id);


--
-- Name: viflearn_k2_extra_fields_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_k2_extra_fields_mapping
    ADD CONSTRAINT viflearn_k2_extra_fields_mapping_pkey PRIMARY KEY (map_id);


--
-- Name: viflearn_k2_extra_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_k2_extra_fields
    ADD CONSTRAINT viflearn_k2_extra_fields_pkey PRIMARY KEY (id);


--
-- Name: viflearn_k2_itemid_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_k2_itemid_associations
    ADD CONSTRAINT viflearn_k2_itemid_associations_pkey PRIMARY KEY (id);


--
-- Name: viflearn_k2_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_k2_items
    ADD CONSTRAINT viflearn_k2_items_pkey PRIMARY KEY (id);


--
-- Name: viflearn_k2_matching_custom_table_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_k2_matching_custom_table
    ADD CONSTRAINT viflearn_k2_matching_custom_table_pkey PRIMARY KEY (module_id);


--
-- Name: viflearn_k2_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_k2_rating
    ADD CONSTRAINT viflearn_k2_rating_pkey PRIMARY KEY ("itemID");


--
-- Name: viflearn_k2_search_tally_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_k2_search_tally
    ADD CONSTRAINT viflearn_k2_search_tally_pkey PRIMARY KEY (search_id);


--
-- Name: viflearn_k2_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_k2_tags
    ADD CONSTRAINT viflearn_k2_tags_pkey PRIMARY KEY (id);


--
-- Name: viflearn_k2_tags_xref_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_k2_tags_xref
    ADD CONSTRAINT viflearn_k2_tags_xref_pkey PRIMARY KEY (id);


--
-- Name: viflearn_listbingo_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_listbingo_categories
    ADD CONSTRAINT viflearn_listbingo_categories_pkey PRIMARY KEY (id);


--
-- Name: viflearn_listbingo_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_listbingo_items
    ADD CONSTRAINT viflearn_listbingo_items_pkey PRIMARY KEY (id);


--
-- Name: viflearn_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_menu
    ADD CONSTRAINT viflearn_menu_pkey PRIMARY KEY (id);


--
-- Name: viflearn_menu_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_menu_types
    ADD CONSTRAINT viflearn_menu_types_pkey PRIMARY KEY (id);


--
-- Name: viflearn_modules_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_modules_menu
    ADD CONSTRAINT viflearn_modules_menu_pkey PRIMARY KEY (moduleid, menuid);


--
-- Name: viflearn_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_modules
    ADD CONSTRAINT viflearn_modules_pkey PRIMARY KEY (id);


--
-- Name: viflearn_spmedia_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_spmedia
    ADD CONSTRAINT viflearn_spmedia_pkey PRIMARY KEY (id);


--
-- Name: viflearn_sppagebuilder_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_sppagebuilder
    ADD CONSTRAINT viflearn_sppagebuilder_pkey PRIMARY KEY (id);


--
-- Name: viflearn_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_tags
    ADD CONSTRAINT viflearn_tags_pkey PRIMARY KEY (id);


--
-- Name: viflearn_user_usergroup_map_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_user_usergroup_map
    ADD CONSTRAINT viflearn_user_usergroup_map_pkey PRIMARY KEY (user_id, group_id);


--
-- Name: viflearn_user_usergroupid_match_planid_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_user_usergroupid_match_planid
    ADD CONSTRAINT viflearn_user_usergroupid_match_planid_pkey PRIMARY KEY (id);


--
-- Name: viflearn_usergroups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_usergroups
    ADD CONSTRAINT viflearn_usergroups_pkey PRIMARY KEY (id);


--
-- Name: viflearn_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_users
    ADD CONSTRAINT viflearn_users_pkey PRIMARY KEY (id);


--
-- Name: viflearn_viewlevels_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY viflearn_viewlevels
    ADD CONSTRAINT viflearn_viewlevels_pkey PRIMARY KEY (id);


--
-- Name: index_articles_on_channel; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_articles_on_channel ON articles USING btree (channel);


--
-- Name: index_assignment_detail_tasks_on_assignment_detail_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_assignment_detail_tasks_on_assignment_detail_id ON assignment_detail_tasks USING btree (assignment_detail_id);


--
-- Name: index_assignment_details_on_assignment_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_assignment_details_on_assignment_id ON assignment_details USING btree (assignment_id);


--
-- Name: index_assignment_details_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_assignment_details_on_user_id ON assignment_details USING btree (user_id);


--
-- Name: index_assignments_on_user_id_and_assignable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_assignments_on_user_id_and_assignable_id ON assignments USING btree (user_id, assignable_id);


--
-- Name: index_badge_assertions_on_organization_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_badge_assertions_on_organization_id ON badge_assertions USING btree (organization_id);


--
-- Name: index_badge_assertions_on_salesforce_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_badge_assertions_on_salesforce_id ON badge_assertions USING btree (salesforce_id);


--
-- Name: index_badge_assertions_on_user_id_and_badge_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_badge_assertions_on_user_id_and_badge_id ON badge_assertions USING btree (user_id, badge_id);


--
-- Name: index_badge_assertions_on_viflearn_assertion_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_badge_assertions_on_viflearn_assertion_id ON badge_assertions USING btree (viflearn_assertion_id);


--
-- Name: index_badge_issuers_on_salesforce_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_badge_issuers_on_salesforce_id ON badge_issuers USING btree (salesforce_id);


--
-- Name: index_badge_issuers_on_viflearn_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_badge_issuers_on_viflearn_id ON badge_issuers USING btree (viflearn_id);


--
-- Name: index_badges_on_issuer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_badges_on_issuer_id ON badges USING btree (issuer_id);


--
-- Name: index_badges_on_salesforce_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_badges_on_salesforce_id ON badges USING btree (salesforce_id);


--
-- Name: index_badges_on_viflearn_badgeid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_badges_on_viflearn_badgeid ON badges USING btree (viflearn_badgeid);


--
-- Name: index_bookmarks_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_bookmarks_on_user_id ON bookmarks USING btree (user_id);


--
-- Name: index_change_logs_on_change_loggable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_change_logs_on_change_loggable_id ON change_logs USING btree (change_loggable_id);


--
-- Name: index_chat_invitations_on_email_and_chat_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_chat_invitations_on_email_and_chat_id ON chat_invitations USING btree (email, chat_id);


--
-- Name: index_chat_invitations_on_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_chat_invitations_on_token ON chat_invitations USING btree (token);


--
-- Name: index_chat_invitations_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_chat_invitations_on_user_id ON chat_invitations USING btree (user_id);


--
-- Name: index_chat_messages_on_chat_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_chat_messages_on_chat_id ON chat_messages USING btree (chat_id);


--
-- Name: index_chat_messages_on_chat_id_and_tweeted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_chat_messages_on_chat_id_and_tweeted_at ON chat_messages USING btree (chat_id, tweeted_at DESC);


--
-- Name: index_chat_messages_on_tweet_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_chat_messages_on_tweet_id ON chat_messages USING btree (tweet_id);


--
-- Name: index_chat_occurrence_summaries_on_schedule_occurrence_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_chat_occurrence_summaries_on_schedule_occurrence_id ON chat_occurrence_summaries USING btree (schedule_occurrence_id);


--
-- Name: index_chat_resources_on_chat_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_chat_resources_on_chat_id ON chat_resources USING btree (chat_id);


--
-- Name: index_chat_resources_on_chat_message_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_chat_resources_on_chat_message_id ON chat_resources USING btree (chat_message_id);


--
-- Name: index_chats_on_archived_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_chats_on_archived_at ON chats USING btree (archived_at);


--
-- Name: index_chats_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_chats_on_name ON chats USING btree (name);


--
-- Name: index_collaborations_on_collaboratable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_collaborations_on_collaboratable_id ON collaborations USING btree (collaboratable_id);


--
-- Name: index_collaborations_on_collaborator_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_collaborations_on_collaborator_id ON collaborations USING btree (collaborator_id);


--
-- Name: index_collaborations_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_collaborations_on_email ON collaborations USING btree (email);


--
-- Name: index_collaborations_on_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_collaborations_on_token ON collaborations USING btree (token);


--
-- Name: index_collaborations_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_collaborations_on_user_id ON collaborations USING btree (user_id);


--
-- Name: index_collection_groups_on_collections; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_collection_groups_on_collections ON collection_groups USING gin (collections);


--
-- Name: index_collection_groups_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_collection_groups_on_user_id ON collection_groups USING btree (user_id);


--
-- Name: index_collection_resources_on_collection_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_collection_resources_on_collection_id ON collection_resources USING btree (collection_id);


--
-- Name: index_collection_resources_on_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_collection_resources_on_resource_id ON collection_resources USING btree (resource_id);


--
-- Name: index_collections_on_flags; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_collections_on_flags ON collections USING gin (flags);


--
-- Name: index_collections_on_tags; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_collections_on_tags ON collections USING gin (tags);


--
-- Name: index_collections_on_viflearn_k2_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_collections_on_viflearn_k2_category_id ON collections USING btree (viflearn_k2_category_id);


--
-- Name: index_comments_on_commentable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comments_on_commentable_id ON comments USING btree (commentable_id);


--
-- Name: index_content_blocks_on_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_content_blocks_on_resource_id ON content_blocks USING btree (resource_id);


--
-- Name: index_content_blocks_on_viflearn_k2_attachment_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_content_blocks_on_viflearn_k2_attachment_id ON content_blocks USING btree (viflearn_k2_attachment_id);


--
-- Name: index_imported_data_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_imported_data_on_item_type_and_item_id ON imported_data USING btree (item_type, item_id);


--
-- Name: index_key_values_on_key; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_key_values_on_key ON key_values USING btree (key);


--
-- Name: index_learning_registry_submissions_on_reviewed_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_learning_registry_submissions_on_reviewed_at ON learning_registry_submissions USING btree (reviewed_at);


--
-- Name: index_notifications_on_params; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_notifications_on_params ON notifications USING gin (params);


--
-- Name: index_notifications_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_notifications_on_user_id ON notifications USING btree (user_id);


--
-- Name: index_notifications_on_user_id_and_acknowledged; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_notifications_on_user_id_and_acknowledged ON notifications USING btree (user_id, acknowledged);


--
-- Name: index_organization_users_on_organization_id_and_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_organization_users_on_organization_id_and_user_id ON organization_users USING btree (organization_id, user_id);


--
-- Name: index_organizations_on_district_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_organizations_on_district_id ON organizations USING btree (district_id);


--
-- Name: index_organizations_on_salesforce_id_and_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_organizations_on_salesforce_id_and_type ON organizations USING btree (salesforce_id, type);


--
-- Name: index_organizations_on_state_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_organizations_on_state_id ON organizations USING btree (state_id);


--
-- Name: index_organizations_on_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_organizations_on_type ON organizations USING btree (type);


--
-- Name: index_question_and_answers_on_chat_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_question_and_answers_on_chat_id ON question_and_answers USING btree (chat_id);


--
-- Name: index_question_and_answers_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_question_and_answers_on_created_at ON question_and_answers USING btree (created_at);


--
-- Name: index_question_and_answers_on_qa_session_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_question_and_answers_on_qa_session_id ON question_and_answers USING btree (qa_session_id);


--
-- Name: index_resources_on_flags; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_resources_on_flags ON resources USING gin (flags);


--
-- Name: index_resources_on_learning_registry_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_resources_on_learning_registry_id ON resources USING btree (learning_registry_id);


--
-- Name: index_resources_on_tags; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_resources_on_tags ON resources USING gin (tags);


--
-- Name: index_resources_on_update_queued_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_resources_on_update_queued_at ON resources USING btree (update_queued_at);


--
-- Name: index_resources_on_url; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_resources_on_url ON resources USING btree (url);


--
-- Name: index_resources_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_resources_on_user_id ON resources USING btree (user_id);


--
-- Name: index_resources_on_viflearn_k2_item_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_resources_on_viflearn_k2_item_id ON resources USING btree (viflearn_k2_item_id);


--
-- Name: index_reviews_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_reviews_on_user_id ON reviews USING btree (user_id);


--
-- Name: index_schedule_occurrences_on_schedulable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_schedule_occurrences_on_schedulable_id ON schedule_occurrences USING btree (schedulable_id);


--
-- Name: index_scheduled_messages_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_scheduled_messages_on_user_id ON scheduled_messages USING btree (user_id);


--
-- Name: index_subscriptions_on_subscribable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subscriptions_on_subscribable_id ON subscriptions USING btree (subscribable_id);


--
-- Name: index_subscriptions_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subscriptions_on_user_id ON subscriptions USING btree (user_id);


--
-- Name: index_tag_groups_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_tag_groups_on_name ON tag_groups USING btree (name);


--
-- Name: index_tag_groups_on_tags; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_tag_groups_on_tags ON tag_groups USING gin (tags);


--
-- Name: index_transcripts_on_chat_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_transcripts_on_chat_id ON transcripts USING btree (chat_id);


--
-- Name: index_transcripts_on_collection_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_transcripts_on_collection_id ON transcripts USING btree (collection_id);


--
-- Name: index_transcripts_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_transcripts_on_user_id ON transcripts USING btree (user_id);


--
-- Name: index_uploaded_files_on_sha256; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_uploaded_files_on_sha256 ON uploaded_files USING btree (sha256);


--
-- Name: index_users_on_auth_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_auth_token ON users USING btree (auth_token);


--
-- Name: index_users_on_auth_tokens; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_auth_tokens ON users USING gin (auth_tokens);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_facebook_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_facebook_id ON users USING btree (facebook_id);


--
-- Name: index_users_on_flags; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_flags ON users USING gin (flags);


--
-- Name: index_users_on_google_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_google_id ON users USING btree (google_id);


--
-- Name: index_users_on_imported_data; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_imported_data ON users USING gin (imported_data);


--
-- Name: index_users_on_twitter_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_twitter_id ON users USING btree (twitter_id);


--
-- Name: index_users_on_viflearn_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_viflearn_user_id ON users USING btree (viflearn_user_id);


--
-- Name: index_versions_on_approved_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_versions_on_approved_at ON versions USING btree (approved_at);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_versions_on_item_type_and_item_id ON versions USING btree (item_type, item_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20141230173325');

INSERT INTO schema_migrations (version) VALUES ('20141230173457');

INSERT INTO schema_migrations (version) VALUES ('20141230223424');

INSERT INTO schema_migrations (version) VALUES ('20141230234559');

INSERT INTO schema_migrations (version) VALUES ('20150101000938');

INSERT INTO schema_migrations (version) VALUES ('20150102021114');

INSERT INTO schema_migrations (version) VALUES ('20150105160446');

INSERT INTO schema_migrations (version) VALUES ('20150105213840');

INSERT INTO schema_migrations (version) VALUES ('20150114224418');

INSERT INTO schema_migrations (version) VALUES ('20150117114927');

INSERT INTO schema_migrations (version) VALUES ('20150120172016');

INSERT INTO schema_migrations (version) VALUES ('20150122032717');

INSERT INTO schema_migrations (version) VALUES ('20150126180601');

INSERT INTO schema_migrations (version) VALUES ('20150130142532');

INSERT INTO schema_migrations (version) VALUES ('20150203194657');

INSERT INTO schema_migrations (version) VALUES ('20150216160701');

INSERT INTO schema_migrations (version) VALUES ('20150217140332');

INSERT INTO schema_migrations (version) VALUES ('20150302225759');

INSERT INTO schema_migrations (version) VALUES ('20150303021153');

INSERT INTO schema_migrations (version) VALUES ('20150331042547');

INSERT INTO schema_migrations (version) VALUES ('20150331163953');

INSERT INTO schema_migrations (version) VALUES ('20150331195909');

INSERT INTO schema_migrations (version) VALUES ('20150401031101');

INSERT INTO schema_migrations (version) VALUES ('20150414124159');

INSERT INTO schema_migrations (version) VALUES ('20150418233429');

INSERT INTO schema_migrations (version) VALUES ('20150427170042');

INSERT INTO schema_migrations (version) VALUES ('20150501115306');

INSERT INTO schema_migrations (version) VALUES ('20150501130136');

INSERT INTO schema_migrations (version) VALUES ('20150501172713');

INSERT INTO schema_migrations (version) VALUES ('20150507005814');

INSERT INTO schema_migrations (version) VALUES ('20150508180904');

INSERT INTO schema_migrations (version) VALUES ('20150508180957');

INSERT INTO schema_migrations (version) VALUES ('20150513111229');

INSERT INTO schema_migrations (version) VALUES ('20150513125412');

INSERT INTO schema_migrations (version) VALUES ('20150521164227');

INSERT INTO schema_migrations (version) VALUES ('20150623144509');

INSERT INTO schema_migrations (version) VALUES ('20150624215556');

INSERT INTO schema_migrations (version) VALUES ('20150625130025');

INSERT INTO schema_migrations (version) VALUES ('20150625231057');

INSERT INTO schema_migrations (version) VALUES ('20150720143417');

INSERT INTO schema_migrations (version) VALUES ('20150728164409');

INSERT INTO schema_migrations (version) VALUES ('20150803200431');

INSERT INTO schema_migrations (version) VALUES ('20150804171118');

INSERT INTO schema_migrations (version) VALUES ('20150810170802');

INSERT INTO schema_migrations (version) VALUES ('20150826203007');

INSERT INTO schema_migrations (version) VALUES ('20150828131023');

INSERT INTO schema_migrations (version) VALUES ('20150831205625');

INSERT INTO schema_migrations (version) VALUES ('20150903214450');

INSERT INTO schema_migrations (version) VALUES ('20150909220751');

INSERT INTO schema_migrations (version) VALUES ('20150915014130');

INSERT INTO schema_migrations (version) VALUES ('20150921210804');

INSERT INTO schema_migrations (version) VALUES ('20150925232934');

INSERT INTO schema_migrations (version) VALUES ('20151009185025');

INSERT INTO schema_migrations (version) VALUES ('20151014124736');

INSERT INTO schema_migrations (version) VALUES ('20151020143440');

INSERT INTO schema_migrations (version) VALUES ('20151020180114');

INSERT INTO schema_migrations (version) VALUES ('20151020183055');

INSERT INTO schema_migrations (version) VALUES ('20151020215857');

INSERT INTO schema_migrations (version) VALUES ('20151021141622');

INSERT INTO schema_migrations (version) VALUES ('20151026161018');

INSERT INTO schema_migrations (version) VALUES ('20151028185134');

INSERT INTO schema_migrations (version) VALUES ('20151028203025');

INSERT INTO schema_migrations (version) VALUES ('20151029172844');

INSERT INTO schema_migrations (version) VALUES ('20151029182547');

INSERT INTO schema_migrations (version) VALUES ('20151029184818');

INSERT INTO schema_migrations (version) VALUES ('20151030195729');

INSERT INTO schema_migrations (version) VALUES ('20151101150130');

INSERT INTO schema_migrations (version) VALUES ('20151101152729');

INSERT INTO schema_migrations (version) VALUES ('20151104191505');

INSERT INTO schema_migrations (version) VALUES ('20151106180507');

INSERT INTO schema_migrations (version) VALUES ('20151109194214');

INSERT INTO schema_migrations (version) VALUES ('20151117174452');

INSERT INTO schema_migrations (version) VALUES ('20151118211744');

INSERT INTO schema_migrations (version) VALUES ('20151119165252');

INSERT INTO schema_migrations (version) VALUES ('20151119221836');

INSERT INTO schema_migrations (version) VALUES ('20151119225415');

INSERT INTO schema_migrations (version) VALUES ('20151201203705');

INSERT INTO schema_migrations (version) VALUES ('20151202213625');

INSERT INTO schema_migrations (version) VALUES ('20151204160502');

INSERT INTO schema_migrations (version) VALUES ('20151208212030');

INSERT INTO schema_migrations (version) VALUES ('20151214200858');

INSERT INTO schema_migrations (version) VALUES ('20151214203926');

INSERT INTO schema_migrations (version) VALUES ('20151216213039');

INSERT INTO schema_migrations (version) VALUES ('20151217163251');

INSERT INTO schema_migrations (version) VALUES ('20151221185258');

INSERT INTO schema_migrations (version) VALUES ('20160107120238');

INSERT INTO schema_migrations (version) VALUES ('20160107132946');

INSERT INTO schema_migrations (version) VALUES ('20160113134408');

INSERT INTO schema_migrations (version) VALUES ('20160125204844');

INSERT INTO schema_migrations (version) VALUES ('20160126165610');

INSERT INTO schema_migrations (version) VALUES ('20160126220421');

INSERT INTO schema_migrations (version) VALUES ('20160202203631');

INSERT INTO schema_migrations (version) VALUES ('20160204182438');

INSERT INTO schema_migrations (version) VALUES ('20160205200428');

INSERT INTO schema_migrations (version) VALUES ('20160208040233');

INSERT INTO schema_migrations (version) VALUES ('20160210203340');

INSERT INTO schema_migrations (version) VALUES ('20160216214106');

INSERT INTO schema_migrations (version) VALUES ('20160218160003');

INSERT INTO schema_migrations (version) VALUES ('20160218233230');

INSERT INTO schema_migrations (version) VALUES ('20160222172647');

INSERT INTO schema_migrations (version) VALUES ('20160223203649');

INSERT INTO schema_migrations (version) VALUES ('20160223204051');

INSERT INTO schema_migrations (version) VALUES ('20160224172501');

INSERT INTO schema_migrations (version) VALUES ('20160225204558');

INSERT INTO schema_migrations (version) VALUES ('20160225204802');

INSERT INTO schema_migrations (version) VALUES ('20160302144243');

INSERT INTO schema_migrations (version) VALUES ('20160311203412');

INSERT INTO schema_migrations (version) VALUES ('20160317173101');

INSERT INTO schema_migrations (version) VALUES ('20160317204417');

INSERT INTO schema_migrations (version) VALUES ('20160321212535');

INSERT INTO schema_migrations (version) VALUES ('20160323192354');

INSERT INTO schema_migrations (version) VALUES ('20160325185934');

INSERT INTO schema_migrations (version) VALUES ('20160331165854');

INSERT INTO schema_migrations (version) VALUES ('20160404205522');

INSERT INTO schema_migrations (version) VALUES ('20160412175403');

INSERT INTO schema_migrations (version) VALUES ('20160606130104');

INSERT INTO schema_migrations (version) VALUES ('20160606163047');

INSERT INTO schema_migrations (version) VALUES ('20160614190746');

INSERT INTO schema_migrations (version) VALUES ('20160628202900');

INSERT INTO schema_migrations (version) VALUES ('20160629184331');

INSERT INTO schema_migrations (version) VALUES ('20160630213928');

INSERT INTO schema_migrations (version) VALUES ('20160701165649');

INSERT INTO schema_migrations (version) VALUES ('20160701165805');

INSERT INTO schema_migrations (version) VALUES ('20160707202323');

INSERT INTO schema_migrations (version) VALUES ('20160708185344');

INSERT INTO schema_migrations (version) VALUES ('20160712100109');

INSERT INTO schema_migrations (version) VALUES ('20160713030408');

INSERT INTO schema_migrations (version) VALUES ('20160718165734');

INSERT INTO schema_migrations (version) VALUES ('20160719202239');

INSERT INTO schema_migrations (version) VALUES ('20160721181137');

INSERT INTO schema_migrations (version) VALUES ('20160721183354');

INSERT INTO schema_migrations (version) VALUES ('20160726185503');

INSERT INTO schema_migrations (version) VALUES ('20160726192520');

INSERT INTO schema_migrations (version) VALUES ('20160728154317');

INSERT INTO schema_migrations (version) VALUES ('20160801193447');

INSERT INTO schema_migrations (version) VALUES ('20160801211532');

INSERT INTO schema_migrations (version) VALUES ('20160802184821');

INSERT INTO schema_migrations (version) VALUES ('20160803184414');

INSERT INTO schema_migrations (version) VALUES ('20160805170533');

INSERT INTO schema_migrations (version) VALUES ('20160809001815');

INSERT INTO schema_migrations (version) VALUES ('20160810165058');

INSERT INTO schema_migrations (version) VALUES ('20160810200727');

INSERT INTO schema_migrations (version) VALUES ('20160810231347');

INSERT INTO schema_migrations (version) VALUES ('20160811001123');

INSERT INTO schema_migrations (version) VALUES ('20160811190047');

INSERT INTO schema_migrations (version) VALUES ('20160811190557');

INSERT INTO schema_migrations (version) VALUES ('20160811202941');

INSERT INTO schema_migrations (version) VALUES ('20160811224207');

INSERT INTO schema_migrations (version) VALUES ('20160815145111');

INSERT INTO schema_migrations (version) VALUES ('20160816184530');

INSERT INTO schema_migrations (version) VALUES ('20160819144709');

INSERT INTO schema_migrations (version) VALUES ('20160820170109');

INSERT INTO schema_migrations (version) VALUES ('20160822030321');

INSERT INTO schema_migrations (version) VALUES ('20160822155600');

INSERT INTO schema_migrations (version) VALUES ('20160823195633');

INSERT INTO schema_migrations (version) VALUES ('20160823231905');

INSERT INTO schema_migrations (version) VALUES ('20160826224149');

INSERT INTO schema_migrations (version) VALUES ('20160829222706');

INSERT INTO schema_migrations (version) VALUES ('20160830200822');

