# practice-chinese-writing

Database preparation:

```sql
CREATE TABLE public.vocab (
    simplified text NOT NULL,
    pinyin text,
    hanviet text,
    cantonese text,
    english jsonb,
    wohok_link text
);

ALTER TABLE ONLY public.vocab
    ADD CONSTRAINT vocab_pkey PRIMARY KEY (simplified);

CREATE TABLE public.listing (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    category text DEFAULT ''::text NOT NULL,
    simplified character varying NOT NULL
);

ALTER TABLE ONLY public.listing
    ADD CONSTRAINT listing_pkey PRIMARY KEY (id);

CREATE FUNCTION public.get_vocab_by_category(category text) RETURNS SETOF public.vocab
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY 
    SELECT vc.*
    FROM vocab vc
    JOIN listing lt ON lt.simplified = vc.simplified
    WHERE lt.category = $1;
END;
```