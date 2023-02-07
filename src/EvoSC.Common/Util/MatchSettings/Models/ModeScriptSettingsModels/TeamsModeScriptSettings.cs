﻿using EvoSC.Common.Util.MatchSettings.Attributes;

namespace EvoSC.Common.Util.MatchSettings.Models.ModeScriptSettingsModels;

/// <summary>
/// Available settings for the Teams mode.
/// </summary>
[ScriptSettingsFor(DefaultModeScriptName.Teams)]
public class TeamsModeScriptSettings : ModeScriptSettings
{
    public new int? ChatTime { get; set; }
    public new bool? CumulatePoints { get; set; }
    public new string? LoadingScreenImageUrl { get; set; }
    public new string? DecoImageUrlCheckpoint { get; set; }
    public new string? DecoImageUrlDecalSponsor4X1 { get; set; }
    public new string? DecoImageUrlScreen16X1 { get; set; }
    public new string? DecoImageUrlScreen16X9 { get; set; }
    public new string? DecoImageUrlScreen8X1 { get; set; }
    public new string? DecoImageUrlWhoAmIUrl { get; set; }
    public new int? DelayBeforeNextMap { get; set; }
    public new int? FinishTimeout { get; set; }
    public new int? ForceLapsNb { get; set; }
    public new bool? InfiniteLaps { get; set; }
    public new bool? IsChannelServer { get; set; }
    public new bool? IsSplitScreen { get; set; }
    public new int? MapsPerMatch { get; set; }
    public new int? MaxPointsPerRound { get; set; }
    public new string? NeutralEmblemUrl { get; set; }
    public new int? PointsGap { get; set; }
    public new int? PointsLimit { get; set; }
    public new string? PointsRepartition { get; set; }
    public new int? RespawnBehaviour { get; set; }
    public new int? RoundsPerMap { get; set; }
    public new string? ScriptEnvironment { get; set; }
    public new string? SeasonIds { get; set; }
    public new bool? SynchronizePlayersAtMapStart { get; set; }
    public new bool? SynchronizePlayersAtRoundStart { get; set; }
    public new bool? TrustClientSimu { get; set; }
    public new bool? UseAlternateRules { get; set; }
    public new bool? UseClublinks { get; set; }
    public new bool? UseClublinksSponsors { get; set; }
    public new bool? UseCrudeExtrapolation { get; set; }
    public new bool? UseCustomPointsRepartition { get; set; }
    public new bool? UseTieBreak { get; set; }
    public new int? WarmUpDuration { get; set; }
    public new int? WarmUpNb { get; set; }
    public new int? WarmUpTimeout { get; set; }
    public new bool? DisableGoToMap { get; set; }
}
