<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
	<channel>
		<title><![CDATA[{if $title}{$title} - {/if}{@PAGE_TITLE|language|escapeCDATA}]]></title>
		<link><![CDATA[{@$baseHref|escapeCDATA}]]></link>
		<description><![CDATA[{@PAGE_DESCRIPTION|escapeCDATA}]]></description>
		<language>{@$__wcf->language->getFixedLanguageCode()}</language>
		<pubDate>{'r'|gmdate:TIME_NOW}</pubDate>
{assign var='dummy' value=$items->rewind()}
		<lastBuildDate>{if $items->valid()}{'r'|gmdate:$items->current()->getTime()}{else}{'r'|gmdate:TIME_NOW}{/if}</lastBuildDate>
		<ttl>60</ttl>
		<generator><![CDATA[WoltLab® Community Framework™ {@WCF_VERSION}]]></generator>
{*		*}{foreach from=$items item='item'}
		<item>
			<title><![CDATA[{@$item->getTitle()|escapeCDATA}]]></title>
			<link><![CDATA[{@$item->getLink()|escapeCDATA}]]></link>
			<description><![CDATA[{@$item->getFormattedMessage()|escapeCDATA}]]></description>
			<pubDate>{'r'|gmdate:$item->getTime()}</pubDate>
			<author><![CDATA[{@$item->getUsername()|escapeCDATA}]]></author>
			<guid><![CDATA[{@$item->getLink()|escapeCDATA}]]></guid>
		</item>
{*		*}{/foreach}
	</channel>
{if ENABLE_BENCHMARK}
	<!-- 
		Execution time: {@$__wcf->getBenchmark()->getExecutionTime()}s ({#($__wcf->getBenchmark()->getExecutionTime()-$__wcf->getBenchmark()->getQueryExecutionTime())/$__wcf->getBenchmark()->getExecutionTime()*100}% PHP, {#$__wcf->getBenchmark()->getQueryExecutionTime()/$__wcf->getBenchmark()->getExecutionTime()*100}% SQL) | SQL queries: {#$__wcf->getBenchmark()->getQueryCount()} | Memory-Usage: {$__wcf->getBenchmark()->getMemoryUsage()}
	
{*	*}{if ENABLE_DEBUG_MODE}
{*		*}{foreach from=$__wcf->getBenchmark()->getItems() item=item}
{*	*}			{if $item.type == 1}(SQL Query) {/if}{$item.text} ({@$item.use}s)
{*		*}{/foreach}
{*	*}{/if}
	-->
{/if}
</rss>